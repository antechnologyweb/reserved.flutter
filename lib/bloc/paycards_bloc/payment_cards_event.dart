part of 'payment_cards_bloc.dart';

@immutable
abstract class PaymentCardsEvent extends Equatable {
  const PaymentCardsEvent();
  @override
  List<Object?> get props => [];
}

class RemovePaymentCard extends PaymentCardsEvent {
  final int cardId;

  const RemovePaymentCard(this.cardId);
}

class LoadPaymentCards extends PaymentCardsEvent {
  final int id;

  const LoadPaymentCards(this.id);
}
