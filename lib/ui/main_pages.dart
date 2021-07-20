import 'dart:io';

import 'package:btime/bloc/categories_bloc/categories_bloc.dart';
import 'package:btime/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:btime/bloc/paycards_bloc/payment_cards_bloc.dart';
import 'package:btime/data/repositories/categories_repository.dart';
import 'package:btime/ui/main_screens/home_page/home_page.dart';
import 'package:btime/ui/main_screens/favorite/favorite_page.dart';
import 'package:btime/ui/main_screens/profile_pages/profile_main.dart';
import 'package:btime/ui/main_screens/reservation_page/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPages extends StatefulWidget {
  final String token;
  final int userId;

  MainPages({Key? key, required this.token,required this.userId}) : super(key: key);

  @override
  _MainPagesState createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  final navigation = NavigationBloc();

  final categoriesBloc = CategoriesBloc(repository: CategoryRepository());


  final list = ['Бронирование', 'Главная', 'Избранное', 'Профиль'];
  saveUserId()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('user_id', widget.userId);
  }

  @override
  void initState() {
    saveUserId();
    categoriesBloc.add(LoadCategoriesEvent(widget.token));
    BlocProvider.of<PaymentCardsBloc>(context).add(LoadPaymentCards(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: navigation),
        BlocProvider.value(value: categoriesBloc),
      ],
      // create: (_) => navigation,
      child: BlocBuilder<NavigationBloc, UIState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              list[state.index],
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          body: IndexedStack(
            index: state.index,
            children: _mainPages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index != 1) {
                navigation.add(UpdateIndex(index));
              } else {
                alertUnderDev(context);
              }
            },
            type: BottomNavigationBarType.shifting,
            items: _navBarItems,
            currentIndex: state.index,
            selectedItemColor: Colors.blue,
          ),
        );
      }),
    );
  }
}

alertUnderDev(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // title: Text(''),
          content: Text('Страница в разработке...'),
        );
      });
}

const List<Widget> _mainPages = [
  const ReservationMainPage(),
  const HomePage(),
  const FavoritesPage(),
  const ProfilePage(),
];

const _navBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home_outlined,
      color: Colors.grey,
    ),
    label: 'Главная',
    activeIcon: Icon(
      Icons.home_outlined,
      color: Color(0xff00A6CA),
    ),
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.search,
      color: Colors.grey,
    ),
    label: 'Избранные',
    activeIcon: Icon(
      Icons.search,
      color: Color(0xff00A6CA),
    ),
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.star_border_outlined,
      color: Colors.grey,
    ),
    label: 'Избранные',
    activeIcon: Icon(
      Icons.star_border_outlined,
      color: Color(0xff00A6CA),
    ),
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.person_outline_outlined,
      color: Colors.grey,
    ),
    label: 'Профиль',
    activeIcon: Icon(
      Icons.person_outline_outlined,
      color: Color(0xff00A6CA),
    ),
  ),
];
