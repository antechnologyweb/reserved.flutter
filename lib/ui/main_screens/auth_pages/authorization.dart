import 'package:btime/constant_vars.dart';
import 'package:btime/ui/main_screens/auth_pages/privacy_policy.dart';
import 'package:btime/ui/main_screens/auth_pages/registration.dart';
import 'package:btime/ui/main_pages.dart';
import 'package:btime/ui/widgets/buttons.dart';
import 'package:btime/ui/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  var phoneFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
  String? _phone;
  //     new MaskedTextController(mask: '+0 (000) 000-00-00', text: '+7');

  String? _password;
  var padding = const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      child: BlocListener<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          print(state.runtimeType);
          state.when(loading: () {
            _loadingOverlay.show(context);
          }, initial: () {
            _loadingOverlay.hide(context);
          }, authorized: (user, list) {
            _loadingOverlay.hide(context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => MainPages(
                          token: user.token,
                      userId: user.id,
                        )),
                (route) => false);
          }, unauthorized: () {
            _loadingOverlay.hide(context);
          }, error: (err) {
            _loadingOverlay.hide(context);
            Fluttertoast.showToast(msg: '$err', timeInSecForIosWeb: 2);
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
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 75,
                      height: 75,
                    ),
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/images/images.png',
                      width: 500,
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        padding,
                        SizedBox(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            // controller: _phone,
                            inputFormatters: [
                              // PhoneInputFormatter(),
                              phoneFormatter
                            ],
                            onChanged: (e) {
                              _phone = e.replaceAll(new RegExp(r"\D"), "");
                            },
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
                        padding,
                        SizedBox(
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            onChanged: (e) {
                              _password = e;
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
                  padding,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    // margin: EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                        ActionButton(
                          onPressed: () {
                            if (_password!.length >= 8) {
                              Map<String, dynamic> map = {
                                "phone": _phone,
                                "password": _password
                              };
                              BlocProvider.of<AuthorizationBloc>(context)
                                  .add(LoginSubmit(map));
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      'Пароль должен состоять из минимум 8 символов');
                            }
                          },
                          color: activeButtonColor,
                          text: 'Войти',
                        ),
                        ActionButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage())),
                          color: inactiveButtonColor,
                          text: 'Регистрация',
                        ),
                        padding,
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PrivacyPolicy();
                            }));
                          },
                          child: Text(
                            'Политика конфиденциальности',
                            style: TextStyle(color: Colors.blue, fontSize: 13),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
