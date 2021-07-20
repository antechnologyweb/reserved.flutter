import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:btime/models/payment_card_model.dart';
import 'package:btime/data/repositories/cards_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'payment_cards_event.dart';
part 'payment_cards_state.dart';
part 'payment_cards_bloc.freezed.dart';

class PaymentCardsBloc extends Bloc<PaymentCardsEvent, PaymentCardsState> {
  PaymentCardsBloc(this.repository) : super(PaymentCardsState.initial());

  final PaymentCardRepository repository;

  @override
  Stream<PaymentCardsState> mapEventToState(
    PaymentCardsEvent event,
  ) async* {
      if (event is RemovePaymentCard) {
      yield PaymentCardsState.showData(
          List.from(await repository.remove(event.cardId)));
    } else if (event is LoadPaymentCards) {
      yield PaymentCardsState.showData(List.from(await repository.load(event.id)));
    } else {
      yield PaymentCardsState.error('Unhandled error');
    }
  }
}
