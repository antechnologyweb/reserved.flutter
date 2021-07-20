import 'package:btime/models/payment_card_model.dart' as store;
import 'package:btime/main.dart';
import 'package:btime/models/payment_card_model.dart';
import 'package:btime/ui/main_screens/profile_pages/add_card_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:btime/bloc/paycards_bloc/payment_cards_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';
class MyCards extends StatefulWidget {
  @override
  _MyCardsState createState() => _MyCardsState();
}


class _MyCardsState extends State<MyCards> {
  // MaskedTextController(mask: '00/00', text: '');
  // TextEditingController _cardNumber = TextEditingController();
  //
  // TextEditingController _cvv = TextEditingController();
  //
  // TextEditingController _dataCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Мои карты',
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2 * 8.0, vertical: 16),
        child: BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
          builder: (context, state) {
            return state.when(
                initial: () => Center(
                      child: Text('some'),
                    ),
                showData: (data) => SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(2 * 8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/images/circles.png'),
                                        Text(data[index].hash),
                                        Expanded(
                                          flex: 1,
                                          child: Container(),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              // data[index].id;
                                              BlocProvider.of<PaymentCardsBloc>(
                                                      context)
                                                  .add(RemovePaymentCard(
                                                      data[index].id));
                                            },
                                            child: Icon(Icons.delete))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          TextButton(
                            onPressed: () {
                              var userState = BlocProvider.of<AuthorizationBloc>(context).state;
                              int? userID;
                              userState.maybeMap(authorized: (userAuthorized){
                                userID = userAuthorized.user.id;
                              },orElse: (){});
                              if(userID!=null){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return CardWebViewForm(id: userID);
                                }));
                              }
                              // _showNewCardFields = !_showNewCardFields;
                              // setState(() {});
                            },
                            child: Text(
                              'Добавить карту',
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          // if (_showNewCardFields)
                          //   CardForm(
                          //     buttonLabel: 'Сохранить',
                          //     card: _cardNumber,
                          //     cvv: _cvv,
                          //     date: _dataCode,
                          //     onPressed: () {
                          //       // var card = Ca
                          //       if (_cardNumber.text.length == 19 &&
                          //           _dataCode.text.length == 5 &&
                          //           _cvv.text.length == 3) {
                          //         // var card = PaymentCard(_cardNumber.text,
                          //         //     _dataCode.text, _cvv.text);
                          //         // BlocProvider.of<PaymentCardsBloc>(context)
                          //         //     .add(AddPaymentCard(card));
                          //       } else
                          //         Fluttertoast.showToast(msg: 'error');
                          //     },
                          //   )
                        ],
                      ),
                    ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (errorMessage) => Center(
                      child: Text('Unimplemented Error'),
                    ));
          },
        ),
      ),
    );
  }
}

// class CardForm extends StatefulWidget {
//   final onPressed;
//   final card;
//   final cvv;
//   final date;
//   final buttonLabel;
//
//   const CardForm(
//       {required this.onPressed,
//       required this.card,
//       required this.cvv,
//       required this.date,
//       required this.buttonLabel})
//       : super();
//
//   @override
//   _CardFormState createState() => _CardFormState();
// }
//
// class _CardFormState extends State<CardForm> {
//   var cardNumberFormatter = new MaskTextInputFormatter(
//       mask: '0000 0000 0000 0000', filter: {"0": RegExp(r'[0-9]')});
//   var cvvFormatter =
//       new MaskTextInputFormatter(mask: '000', filter: {"0": RegExp(r'[0-9]')});
//   var dateFormatter = new MaskTextInputFormatter(
//       mask: '00/00', filter: {"0": RegExp(r'[0-9]')});
//
//   late TextEditingController _cardNumber;
//
//   late TextEditingController _cvv;
//
//   late TextEditingController _dataCode;
//
//   @override
//   void initState() {
//     _cardNumber = widget.card;
//     _cvv = widget.cvv;
//     _dataCode = widget.date;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 20),
//           child: TextField(
//             controller: _cardNumber,
//             keyboardType: TextInputType.number,
//             inputFormatters: [cardNumberFormatter],
//             decoration: InputDecoration(
//               hintText: 'Номер карты',
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(color: Colors.grey)),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 10),
//           child: TextField(
//             controller: _dataCode,
//             keyboardType: TextInputType.datetime,
//             inputFormatters: [dateFormatter],
//             decoration: InputDecoration(
//               hintText: 'Срок действия карты ',
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(color: Colors.grey)),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 10),
//           child: TextField(
//             keyboardType: TextInputType.number,
//             controller: _cvv,
//             inputFormatters: [cvvFormatter],
//             decoration: InputDecoration(
//               hintText: 'CVV',
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(40),
//                   borderSide: BorderSide(color: Colors.grey)),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 16,
//         ),
//         RaisedButton(
//           onPressed: widget.onPressed,
//           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
//           color: Color(0xff00A6CA),
//           shape: RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(30.0)),
//           child: Text(
//             '${widget.buttonLabel}',
//             style: GoogleFonts.roboto(
//                 fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
