import 'package:equatable/equatable.dart';

class PaymentCard extends Equatable {
  final String hash;
  final int id;
  final int cardId;

  const PaymentCard({required this.hash,required this.cardId,required this.id});

  @override
  List<Object?> get props => [hash, cardId];

  factory PaymentCard.fromJson(Map<String, dynamic>json){
    return PaymentCard(
      hash: json['hash'] as String,
      id: json['id'] as int,
      cardId: json['card_id'] as int,
    );
  }
}
