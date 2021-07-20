import 'dart:convert';
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';
import 'package:btime/bloc/reservation_bloc/reservation_bloc.dart';
import 'package:btime/bloc/restaurants_bloc/restaurants_bloc.dart';
import 'package:btime/bloc/search_bloc/search_bloc.dart';
import 'package:btime/bloc/tables_bloc/tables_bloc.dart';
import 'package:btime/main.dart';
import 'package:btime/models/restaurants_model/restaurants_model.dart';
import 'package:btime/ui/main_pages.dart';
import 'package:btime/ui/main_screens/reservation_page/pay_webview.dart';
import 'package:btime/ui/main_screens/reservation_page/organization_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrganizationListScreen extends StatefulWidget {
  final categoryId;
  final categoryName;

  const OrganizationListScreen({Key? key, this.categoryId, this.categoryName})
      : super(key: key);

  @override
  _OrganizationListScreenState createState() => _OrganizationListScreenState();
}

class _OrganizationListScreenState extends State<OrganizationListScreen> {
  final searchInCategoryBloc = SearchInCatBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchInCategoryBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.categoryName}',
            style: GoogleFonts.roboto(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<SearchInCatBloc, SearchState>(
              builder: (context, searchState) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: TextField(
                        onChanged: (e) {
                          searchInCategoryBloc.add(SearchActiveInCategory(
                              e, widget.categoryId.toString()));
                        },
                        decoration: InputDecoration(
                          hintText: 'Поиск',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          focusColor: Colors.black,
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
                      margin: EdgeInsets.only(top: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Популярные рестораны',
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Все',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
                        builder: (context, state) {
                          if (searchState is SearchResultState) {
                            return Container(
                              margin: EdgeInsets.only(top: 42),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, item) =>
                                    OrganizationItem(
                                        searchState.restaurants[item]),
                                itemCount: searchState.restaurants.length,
                              ),
                            );
                          } else
                            return state.when(
                                empty: () => Center(
                                      child: Text('пусто'),
                                    ),
                                show: (organizations) => Container(
                                      margin: EdgeInsets.only(top: 42),
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, item) =>
                                            OrganizationItem(
                                                organizations[item]),
                                        itemCount: organizations.length,
                                      ),
                                    ),
                                loading: () =>
                                    Center(child: CircularProgressIndicator()),
                                error: (err) => Center(
                                      child: Text(err),
                                    ));
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OrganizationItem extends StatefulWidget {
  OrganizationItem(this.organization);
  final Restaurant organization;

  @override
  _OrganizationItemState createState() => _OrganizationItemState();
}

class _OrganizationItemState extends State<OrganizationItem> {
  late Restaurant organization;
  // final TablesBloc tableBloc = TablesBloc(MyApp.reservationRepo);

  @override
  void initState() {
    organization = widget.organization;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var userState =
    //     BlocProvider.of<AuthorizationBloc>(context, listen: false).state;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrganizationScreen(
                  organization: organization,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(top: 24, left: 20, bottom: 20, right: 20),
        decoration: BoxDecoration(
          color: Color(0xffEBF3F4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                '${organization.title}',
                style: GoogleFonts.openSans(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
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
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      '${organization.rating ?? 0}',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                '${organization.address}',
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
