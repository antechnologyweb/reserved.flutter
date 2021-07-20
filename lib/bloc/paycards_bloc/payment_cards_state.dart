part of 'payment_cards_bloc.dart';

@freezed
class PaymentCardsState with _$PaymentCardsState {
  const factory PaymentCardsState.initial() = InitialState;
  const factory PaymentCardsState.showData(List<PaymentCard> cardList) =
      LoadedData;
  const factory PaymentCardsState.loading() = LoadingState;
  const factory PaymentCardsState.error([String? message]) = ErrorState;
}
