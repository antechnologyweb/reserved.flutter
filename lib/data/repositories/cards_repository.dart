import 'dart:convert';

import 'package:btime/http_client/http_client.dart';
import 'package:btime/models/payment_card_model.dart';

class PaymentCardRepository {
  PaymentCardRepository();

  // loadBox() async {}

  Set<PaymentCard> cardList = new Set();

  load(int id) async{
    var response = await HttpClientS.get(routeEndPoint: 'card/user/$id');
    Iterable l = json.decode(response.body);
    List<PaymentCard> cards = List<PaymentCard>.from(l.map((model){
      print(model);
      return PaymentCard.fromJson(model);
    }));
    cardList = Set.from(cards);
    return cards;
  }

  remove(int id) async{
    cardList.removeWhere((element) => element.id==id);
    // return cardList;

    var response = await HttpClientS.get(routeEndPoint: 'card/delete/$id');

    print(jsonDecode(response.body));
    return cardList;
  }
}
