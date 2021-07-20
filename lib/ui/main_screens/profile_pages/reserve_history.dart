import 'dart:convert';

import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';
import 'package:btime/http_client/http_client.dart';
import 'package:btime/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationHistory extends StatefulWidget {
  @override
  _ReservationHistoryState createState() => _ReservationHistoryState();
}

class _ReservationHistoryState extends State<ReservationHistory> {
  List<Booking>? list;

  loadBookings()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uId = pref.getInt('user_id');
    print(uId);
    var response =await  HttpClientS.get(routeEndPoint: 'booking/user/$uId');
    var l = jsonDecode(response.body);
    list =  List<Booking>.from(l['data'].map((model)=> Booking.fromJson(model)));
    setState(() {

    });
  }

  @override
  void initState() {
    loadBookings();

      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'История броней',
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: list!=null?ListView.builder(
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return _Booking(list![index]);
          }):Center(child: CircularProgressIndicator(),),
    );
  }
}

class _Booking extends StatelessWidget {
  final Booking booking;
  const _Booking(this.booking);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      padding: const EdgeInsets.only(top: 24, left: 20, bottom: 20, right: 20),
      decoration: BoxDecoration(
        color: const Color(0xffEBF3F4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Номер брони: '),
              const Expanded(flex: 1, child: SizedBox()),
              Text('${booking.id}'),
            ],
          ),
          Row(
            children: [
              const Text('Забронированное время: '),
              const Expanded(flex: 1, child: SizedBox()),
              Text(booking.time.replaceRange(5, 8, '')),
            ],
          ),
          Row(
            children: [
              const Text('Дата:'),
              const Expanded(flex: 1, child: SizedBox()),
              Text(booking.date),
            ],
          ),
          Row(
            children: [
              const Text('Статус:'),
              const Expanded(flex: 1, child: SizedBox()),
              Text(booking.status),
            ],
          ),
          Row(
            children: [
              const Text('Стоимость:'),
              const Expanded(flex: 1, child: SizedBox()),
              Text(booking.price),
            ],
          ),
        ],
      ),
    );
  }
}
