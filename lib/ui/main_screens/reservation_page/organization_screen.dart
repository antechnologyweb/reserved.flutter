import 'dart:convert';

import 'package:btime/bloc/favourites_bloc/favorite_bloc.dart';
import 'package:btime/bloc/tables_bloc/tables_bloc.dart';
import 'package:btime/http_client/http_client.dart';
import 'package:btime/main.dart';
import 'package:btime/models/reservation_model.dart';
import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:btime/ui/main_screens/reservation_page/reservation_time_pick_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizationScreen extends StatefulWidget {
  final Restaurant organization;

  const OrganizationScreen({Key? key, required this.organization})
      : super(key: key);

  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  late Restaurant organization;

  @override
  void initState() {
    organization = widget.organization;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${organization.title}',
          style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CarouselSlider(
                  items: [
                    Image.asset(
                      'assets/images/mainPage.jpg',
                    ),
                    // Image.network(
                    //   '$fileEndPoint${organization.image}',
                    //   scale: 0.5,
                    // )
                  ],
                  options: CarouselOptions(),
                ),
              ),
              DotsIndicator(dotsCount: 1),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '${organization.title}',
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: (organization.rating ?? 0) > 0
                                  ? Color(0xffF2994A)
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              color: (organization.rating ?? 0) > 1
                                  ? Color(0xffF2994A)
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              color: (organization.rating ?? 0) > 2
                                  ? Color(0xffF2994A)
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              color: (organization.rating ?? 0) > 3
                                  ? Color(0xffF2994A)
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.star,
                              color: (organization.rating ?? 0) > 4
                                  ? Color(0xffF2994A)
                                  : Colors.grey,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                '${organization.rating}',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, newState) {
                        if (newState is FavoriteInitial)
                          return GestureDetector(
                            onTap: () {
                              var bloc = BlocProvider.of<FavoriteBloc>(context);
                              if (newState is FavoriteInitial) {
                                newState.favorite.contains(organization)
                                    ? bloc.add(RemoveFavorite(organization))
                                    : bloc.add(AddFavorite(organization));
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(17),
                              decoration: BoxDecoration(
                                  color: Color(0xffEBF3F4),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Icon(
                                newState.favorite.contains(organization)
                                    ? Icons.star
                                    : Icons.star_border,
                                // color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          );
                        return Text('this textwidget never be returned');
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 32),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${organization.description}',
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            // color: Theme.of(context).secondaryHeaderColor,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                '${organization.address}',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            // color: Theme.of(context).secondaryHeaderColor,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                '9.00 - 01.00',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 48),
                      child: ButtonTheme(
                        minWidth: 264,
                        height: 48,
                        child: RaisedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseDateTimeScreen(
                                        organization: organization,
                                      ))),
                          color: Color(0xff00A6CA),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text(
                            'Перейти к брони',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 2 * 8.0),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         'Отзывы',
                    //         style: GoogleFonts.roboto(
                    //             fontSize: 17,
                    //             fontWeight: FontWeight.w400,
                    //             color: Colors.black),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // MessageField()
                  ],
                ),
              )
            ],
          )),
    );
  }
}
//
// class MessageField extends StatefulWidget {
//   @override
//   _MessageFieldState createState() => _MessageFieldState();
// }
//
// class _MessageFieldState extends State<MessageField> {
//   bool show = false;
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FeedbackItem(),
//         SizedBox(
//           height: 32,
//         ),
//         FeedbackItem(),
//       ],
//     );
//   }
// }
//
// class FeedbackItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 60,
//                 child: CircleAvatar(
//                   foregroundImage: NetworkImage(
//                       'https://i.pinimg.com/474x/74/ed/f2/74edf2e846eb720b63b7fd980ef687e4.jpg'),
//                   radius: 30,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(' Анна Симонова'),
//                   Container(
//                     // width: MediaQuery.of(context).size.width - 16,
//                     height: 20,
//                     child: Row(
//                       children: [
//                         ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 5,
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                               );
//                             })
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Text('Хороший ресторан, вкусная еда, приветливый персонал.'),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             '14.11.2020',
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       ),
//     );
//   }
// }
