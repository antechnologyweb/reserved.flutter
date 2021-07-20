import 'package:btime/bloc/paycards_bloc/payment_cards_bloc.dart';
import 'package:btime/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:btime/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:btime/bloc/tables_bloc/tables_bloc.dart';
import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:btime/data/repositories/reservation_repository.dart';
import 'package:btime/ui/main_screens/profile_pages/add_card_webview.dart';
import 'package:btime/ui/main_screens/reservation_page/pay_webview.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:btime/main.dart';
import 'junk/menu_item.dart' as custom;
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';

class ChooseDateTimeScreen extends StatefulWidget {
  final Restaurant organization;
  final reservationRepo = const ReservationRepository();

  const ChooseDateTimeScreen({Key? key, required this.organization})
      : super(key: key);

  @override
  _ChooseDateTimeScreenState createState() => _ChooseDateTimeScreenState();
}

class _ChooseDateTimeScreenState extends State<ChooseDateTimeScreen> {
  late TablesBloc tablesBloc=TablesBloc(widget.reservationRepo);
  late ReservationBloc reservationBloc = ReservationBloc(widget.reservationRepo);
  var startTime = new MaskTextInputFormatter(mask: '20:50', filter: {
    "2": RegExp(r'[0-2]'),
    "0": RegExp(r'[0-9]'),
    "5": RegExp(r'[0-5]')
  });
  String? cardNumber;

  var fillColor = Color(0xffEBF3F4);
  var borders = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Color(0xffEBF3F4)));
  var padding = const SizedBox(height: 16);

  var time = DateTime.now();

  late Map<String, dynamic> form = {};

  @override
  void initState() {
    tablesBloc.add(LoadTables(organizationId: widget.organization.id));

    var bloc = BlocProvider.of<AuthorizationBloc>(context).state;

    bloc.maybeWhen(
        authorized: (user, bookingList) {
          var timeS = time.minute.toString().length;
          var zero = timeS==1?'0':'';
          var date = DateTime.now().toString();
          form = {
            "user_id": user.id,
            "organization_id": widget.organization.id,
            "price": widget.organization.price,
            "timezone": 'Asia/Almaty',
            "time": "${time.hour}:$zero${time.minute}",
            "date": date.substring(0, date.indexOf(' ')),
          };
        },
        orElse: () {});

    super.initState();
  }

  @override
  void dispose() {
    tablesBloc.close();
    reservationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: reservationBloc),
        BlocProvider.value(value: tablesBloc),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<ReservationBloc, ReservationState>(
            listener: (context, reservationState) {
              if(reservationState is ReservationSuccess){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => PaymentPage(url: "https://reserved.org.kz/form/${reservationState.url}")
                    ));
              }
              if (reservationState is ReservationError) {
                Fluttertoast.showToast(msg: 'Ошибка резервации!');
              }
            },
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Выберите время и стол',
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
                    // stream: null,
                      builder: (context, state) {
                        return state.maybeWhen(showData: (data)=>
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  padding,
                                  Row(
                                    children: [
                                     const Icon(
                                        Icons.calendar_today,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'Выбрать дату',
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                  padding,

                                  DatePicker(
                                    DateTime.now(),
                                    height: 80,
                                    dateTextStyle: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400, fontSize: 14),
                                    monthTextStyle: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400, fontSize: 12),
                                    initialSelectedDate: DateTime.now(),
                                    selectionColor: Color(0xff00A6CA),
                                    selectedTextColor: Colors.white,
                                    onDateChange: (date) {
                                      // New date selected
                                      setState(() {
                                        var e = date.toString();
                                        form['date'] = e.substring(0, e.indexOf(' '));
                                      });
                                    },
                                    locale: "ru_RU",
                                  ),
                                  padding,

                                  Row(
                                    children: [
                                     const Icon(
                                        Icons.access_time,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'Выбрать время',
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  padding,

                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          inputFormatters: [startTime],
                                          onChanged: (e) {
                                            form["time"] = e;
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: fillColor,
                                            hintText: '${form["time"]}',
                                            enabledBorder: borders,
                                            focusedBorder: borders,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  padding,

                                  Row(
                                    children: [
                                     const Icon(
                                        Icons.check,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'Выбрать столик',
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  padding,
                                  BlocBuilder<TablesBloc, TablesState>(
                                    builder: (context, state) {
                                      if (state is TablesLoaded)
                                        return Column(
                                          children: [
                                            ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: state.data.length,
                                                itemBuilder: (context, index) {
                                                  var border = OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(40),
                                                      borderSide: BorderSide(color: fillColor));
                                                  return Padding(
                                                    padding: const EdgeInsets.only(bottom: 16.0),
                                                    child: custom.DropdownButtonFormField(
                                                        dropdownColor: fillColor,

                                                        elevation: 0,
                                                        decoration: InputDecoration(
                                                          hintText: '${state.data[index].name}',
                                                          filled: true,
                                                          fillColor: fillColor,
                                                          errorStyle:
                                                          TextStyle(color: Colors.yellow),
                                                          enabledBorder: border,
                                                          focusedBorder: border,
                                                        ),
                                                        onChanged: (value) {
                                                          form['organization_table_list_id'] = value;
                                                          setState(() {

                                                          });
                                                        },
                                                        items: state
                                                            .data[index].organization_tables
                                                            .map((map) {
                                                          return custom.DropdownMenuItem(
                                                            child: Text('Стол #${map.id}'),
                                                            value: map.id,
                                                          );
                                                        }).toList()),
                                                  );
                                                })
                                          ],
                                        );
                                      else
                                        return Center(child: CircularProgressIndicator());
                                    },
                                  ),
                                  data.isNotEmpty? ListView.builder(
                                      itemCount: data.length,
                                      padding: EdgeInsets.zero,

                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if(form['card_id']==null){
                                          form['card_id'] = data.first.cardId;
                                        }
                                        return ListTile(
                                          onTap: (){
                                            form['card_id'] = data[index].cardId;
                                            setState(() {

                                            });
                                          },
                                          title: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/circles.png'),
                                              Text(data[index].hash),
                                              Expanded(
                                                flex: 1,
                                                child: Container(),
                                              ),
                                              if(form['card_id'] == data[index].cardId)Icon(Icons.done)
                                            ],
                                          ),
                                        );
                                      }):
                                  Column(
                                    children: [
                                      TextButton(
                                        onPressed: () async{
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
                                    ],
                                  ),
                                  padding,

                                  RaisedButton(
                                    onPressed: () async {
                                      var tableChosen=form['organization_table_list_id'] != null;
                                      var cardChosen=form['card_id']!=null;
                                      var cardExist=data.isNotEmpty;
                                      if (tableChosen&&cardExist&&cardChosen) {
                                        BlocProvider.of<ReservationBloc>(context).add(AddReservation(form));
                                      } else {
                                        String message='Выберите стол!';
                                        if(!cardExist){
                                          message='Добавьте карту!';
                                        }else if(!cardChosen){
                                          message='Выберите карту!';
                                        }
                                        Fluttertoast.showToast(msg: '$message');
                                      }

                                    },
                                    color: (form['organization_table_list_id'] == null||form['card_id']==null)?Colors.grey:Color(0xff00A6CA),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0)),
                                    child: BlocBuilder<ReservationBloc, ReservationState>(builder: (context, state){
                                      if(state is ReservationLoading){
                                        return SizedBox(
                                          width: 100,
                                          child: Center(
                                            child: SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: CircularProgressIndicator()),
                                          ),
                                        );
                                      }
                                      return Text(
                                        'Забронировать столик',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            orElse: (){return const Text('Ошибка');});
                      }
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
