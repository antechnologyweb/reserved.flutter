import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigation_events.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<IndexEvents, UIState> {
  NavigationBloc() : super(UIState(index: 0));

  @override
  Stream<UIState> mapEventToState(IndexEvents event) async* {
    if (event is UpdateIndex) {
      yield UIState(index: event.index);
    }
  }
}
