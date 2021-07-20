import 'dart:convert';

import 'package:btime/bloc/favourites_bloc/favorite_bloc.dart';
import 'package:btime/bloc/favourites_bloc/favorite_bloc.dart';
import 'package:btime/ui/main_screens/reservation_page/organizations_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:btime/main.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage();

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    print('initializing fav');
    BlocProvider.of<FavoriteBloc>(context).add(LoadFavorites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteInitial) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return OrganizationItem(state.favorite.elementAt(index));
              },
              itemCount: state.favorite.length,
            ),
          ));
        } else
          return Center(
            child: Text('Unimplemented error'),
          );
      },
    );
  }
}
