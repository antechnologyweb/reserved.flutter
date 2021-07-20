import 'dart:convert';

import 'package:btime/ui/main_pages.dart';
import 'package:btime/ui/main_screens/auth_pages/authorization.dart';
import 'package:btime/ui/main_screens/profile_pages/my_cards.dart';
import 'package:btime/ui/main_screens/profile_pages/reserve_history.dart';
import 'package:btime/ui/main_screens/profile_pages/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:btime/main.dart';
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          unauthorized: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AuthorizationPage()),
                (route) => false);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
            authorized: (user, list) => SingleChildScrollView(
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.bottomCenter)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.only(top: 76),
                        //   alignment: Alignment.center,
                        //   child: CircleAvatar(
                        //     foregroundImage:
                        //         NetworkImage(fileEndPoint + '${user.avatar}'),
                        //     backgroundColor: Color(0xffEBF3F4),
                        //     radius: 82,
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Text(
                            user.name,
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          child: RaisedButton(
                            onPressed: () async {
                              alertUnderDev(context);

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             UserProfileEditScreen()));
                            },
                            color: Color(0xffEBF3F4),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              'Редактировать профиль',
                              style: GoogleFonts.roboto(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          child: RaisedButton(
                            onPressed: () async {
                              // alertUnderDev(context);
                              //
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReservationHistory()));
                            },
                            color: Color(0xffEBF3F4),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              'История брони',
                              style: GoogleFonts.roboto(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          child: RaisedButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyCards()));
                            },
                            color: Color(0xffEBF3F4),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              'Мои карты',
                              style: GoogleFonts.roboto(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          child: RaisedButton(
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove('token');
                              BlocProvider.of<AuthorizationBloc>(context)
                                  .add(LogOutSubmit());
                              // pushNewScreen(
                              //   context,
                              //   screen: AuthorizationPage(),
                              //   withNavBar: false, // OPTIONAL VALUE. True by default.
                              //   pageTransitionAnimation:
                              //       PageTransitionAnimation.cupertino,
                              // );
                            },
                            color: Color(0xffEBF3F4),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              'Выйти',
                              style: GoogleFonts.roboto(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            unauthorized: () => Container(
                  child: Text('Пожалуйста, авторизуйтесь!'),
                ),
            orElse: () {
              return Container(
                child: Text('Непредвиденная ошибка'),
              );
            });
      },
    );
  }
}
