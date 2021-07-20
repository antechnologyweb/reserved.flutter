import 'package:btime/bloc/favourites_bloc/favorite_bloc.dart';
import 'package:btime/bloc/restaurants_bloc/restaurants_bloc.dart';
import 'package:btime/fcm.dart';
import 'package:btime/data/repositories/auth_repository.dart';
import 'package:btime/data/repositories/cards_repository.dart';
import 'package:btime/data/repositories/favors_repository.dart';
import 'package:btime/data/repositories/restaraunts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'ui/main_screens/auth_pages/authorization.dart';
import 'package:btime/bloc/authorization_blocs/authorization_bloc.dart';
import 'package:btime/bloc/paycards_bloc/payment_cards_bloc.dart';


late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//refactor needed
//add dep.injection(repo interfaces etc)
//http service
//

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  initialize();

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final restaurantBloc = RestaurantsBloc(RestaurantsRepository());
  final cardsBloc = PaymentCardsBloc(PaymentCardRepository());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: restaurantBloc),
        BlocProvider.value(value: FavoriteBloc(FavoritesRepository())),
        BlocProvider(
          create: (BuildContext context) =>
              AuthorizationBloc(AuthenticationRepository())
                ..add(LoginViaTokenSubmit()),
        ),
        BlocProvider.value(value: cardsBloc ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'B-time',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.white,
          secondaryHeaderColor: Color(0xff00A6CA),
          appBarTheme: AppBarTheme(color: Colors.white),
        ),
        home: AuthorizationPage(),
      ),
    );
  }
}

final endpoint = 'https://b-time.a-lux.dev/api';
final fileEndPoint = 'https://b-time.a-lux.dev/storage/';


