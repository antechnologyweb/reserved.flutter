import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:btime/models/categories_model/categories_model.dart';
import 'package:btime/data/repositories/categories_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.repository}) : super(CategoriesState.initial());
  final CategoryRepository repository;

  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    if (event is LoadCategoriesEvent) {
      yield CategoriesState.loading();
      try {
        final data = await repository.getCategory();
        yield CategoriesState.show(data!);
      } on SocketException {
        yield CategoriesState.error('Нет соединения с интернетом');
      } catch (error) {}
    } else {
      print('no such event ${event.runtimeType}');
      yield CategoriesState.error('Не удалось загрузить категории!');
    }
  }
}
