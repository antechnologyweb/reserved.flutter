import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:btime/ui/main_screens/auth_pages/authorization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:btime/main.dart';

class UserProfileEditScreen extends StatefulWidget {
  @override
  _UserProfileEditScreenState createState() => _UserProfileEditScreenState();
}

class _UserProfileEditScreenState extends State<UserProfileEditScreen> {
  var client = http.Client();
  bool openImageChoose = false;
  TextEditingController _phone = TextEditingController();
  // MaskedTextController(mask: '+0 (000) 000-00-00', text: '+7');
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _city = TextEditingController();
  List<dynamic>? cities = [];

  Map<String, dynamic>? user;

  File? _image;
  final picker = ImagePicker();

  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future chooseFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Обновление профиля'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  headerAnimationLoop: false,
                  useRootNavigator: true,
                  dialogType: DialogType.NO_HEADER,
                  body: Column(
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          await chooseFromGallery();
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text(
                          'Выбрать из галереи',
                          style: GoogleFonts.openSans(color: Colors.white),
                        ),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          await chooseImage();
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text(
                          'Снять фото',
                          style: GoogleFonts.openSans(color: Colors.white),
                        ),
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      _image != null
                          ? RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                              child: Text('Удалить фото'),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                  title: 'This is Ignored',
                  desc: 'This is also Ignored',
                  // onDissmissCallback: () => {},
                  showCloseIcon: true,
                )..show();
              },
              child: Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: openImageChoose ? 0 : 20),
                alignment: Alignment.center,
                child: CircleAvatar(
                  foregroundImage: (_image != null
                          ? FileImage(_image!)
                          : NetworkImage(
                              '${user != null ? fileEndPoint + user!['avatar'].toString().replaceAll('public/', '') : ''}'))
                      as ImageProvider<Object>?,
                  backgroundColor: Color(0xffEBF3F4),
                  radius: 52,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        hintText: 'Ваше имя',
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Ваш телефон',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      // if (cities!.length == 0) {getCities()}
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: 'Ваш город',
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                        onChanged: (dynamic value) {
                          _city.text = value.toString();
                        },
                        items: cities!.map((city) {
                          return DropdownMenuItem(
                            child: Text(city['name']),
                            value: city['id'],
                          );
                        }).toList(),
                        value: user != null ? user!['city_id'] : '',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Ваш пароль',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // RaisedButton(
                  //   onPressed: () async {
                  //     SharedPreferences prefs =
                  //         await SharedPreferences.getInstance();
                  //     prefs.remove('token');
                  //
                  //     // pushNewScreen(
                  //     //   context,
                  //     //   screen: AuthorizationPage(),
                  //     //   withNavBar:
                  //     //       false, // OPTIONAL VALUE. True by default.
                  //     //   pageTransitionAnimation:
                  //     //       PageTransitionAnimation.cupertino,
                  //     // );
                  //   },
                  //   color: Color(0xffEBF3F4),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: new BorderRadius.circular(30.0)),
                  //   child: Text(
                  //     'Выйти',
                  //     style: GoogleFonts.roboto(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                  RaisedButton(
                    onPressed: () {},
                    // onPressed: () => update(),
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      'Обновить профиль',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
