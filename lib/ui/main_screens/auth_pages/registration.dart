import 'package:btime/ui/main_screens/auth_pages/privacy_policy.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:btime/constant_vars.dart';
import 'package:btime/ui/main_pages.dart';
import 'package:btime/ui/widgets/buttons.dart';
import 'package:btime/ui/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var phoneFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  bool hasRead = false;

  String? _phone;
  // MaskedTextController(mask: '+0 (000) 000-00-00', text: '+7');
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();

  Map<String, dynamic> getMap() {
    Map<String, dynamic> body = {
      "phone": _phone,
      "password": _password.text,
      "name": _name.text,
    };
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        state.when(loading: () {
          _loadingOverlay.show(context);
        }, initial: () {
          _loadingOverlay.hide(context);
        }, authorized: (user, list) {
          _loadingOverlay.hide(context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => MainPages(token: user.token, userId: user.id,)),
              (route) => false);
        }, unauthorized: () {
          _loadingOverlay.hide(context);
        }, error: (err) {
          _loadingOverlay.hide(context);
          Fluttertoast.showToast(msg: '$err', timeInSecForIosWeb: 2);

          print(err);
        });
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),

                SizedBox(
                    child: Text(
                      'Reserved',
                      style: GoogleFonts.roboto(
                          fontSize: 19, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  child: Image.asset(
                    'assets/images/images.png',
                    width: 360,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      SizedBox(
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
                      SizedBox(height: 10,),

                      SizedBox(
                        child: TextField(
                          onChanged: (e) {
                            _phone = e.replaceAll(new RegExp(r"\D"), "");
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [phoneFormatter],
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
                      SizedBox(height: 10,),
                      SizedBox(
                        child: TextField(
                          controller: _password,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          onChanged: (e) {
                            print(_password.text);
                          },
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
                SizedBox(height: 32,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: hasRead, onChanged: (value) {
                            hasRead = !hasRead;
                            setState(() {

                            });
                          }),
                          Expanded(
                            child: Wrap(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return PrivacyPolicy();
                                    }));
                                    hasRead = true;
                                    setState(() {});
                                  },
                                  child: Text(
                                    'Я соглашаюсь с политикой конфиденциальности',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 13),
                                  ),
                                ),
                                Text(' и '),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Contracts();
                                    }));
                                  },
                                  child: Text(
                                    'договор оферты',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ActionButton(
                        onPressed: () {
                          if (_password.text.length >= 8&&hasRead) {
                            BlocProvider.of<AuthorizationBloc>(context)
                                .add(RegisterSubmit(getMap()));
                          } else {
                            var message =
                                'Чтобы зарегистрироваться, нужно принять соглашение';
                            Fluttertoast.showToast(
                                msg: hasRead
                                    ? 'Пароль должен состоять из минимум 8 символов'
                                    : message);
                          }
                        },
                        color: activeButtonColor,
                        text: 'Зарегистрироваться',
                      ),
                      ActionButton(
                        onPressed: () => Navigator.pop(context),
                        color: inactiveButtonColor,
                        text: 'Войти',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
