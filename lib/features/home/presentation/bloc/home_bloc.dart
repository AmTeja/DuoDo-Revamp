import 'dart:async';

import 'package:duodo/core/domain/entities/todo.dart';
import 'package:duodo/core/exceptions/duo_exception.dart';
import 'package:duodo/core/helpers/duo_logger.dart';
import 'package:duodo/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository homeRepository})
      : _repository = homeRepository,
        super(HomeState(selectedDay: DateTime.now())) {
    on<HomeLoadTodos>(_onLoadTodos);
    on<HomeTodosLoaded>(_onTodosLoaded);
    on<HomeTodoUpdated>(_onTodoUpdated);
    on<HomeDayChanged>(_onDayChanged);
  }

  final HomeRepository _repository;

  Future<void> _onLoadTodos(
    HomeLoadTodos event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      _repository.getAllTodos().listen(
        (todos) {
          add(HomeTodosLoaded(todos));
        },
      );
    } on Exception catch (e, s) {
      Log().error(DuoException(e, stackTrace: s));
      emit(state.copyWith(status: HomeStateStatus.error));
    }
  }

  Future<void> _onTodosLoaded(
    HomeTodosLoaded event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      status: HomeStateStatus.loaded,
      todos: event.todos,
    ));
  }

  Future<void> _onTodoUpdated(
    HomeTodoUpdated event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _repository.updateTodo(event.todo);
    } on Exception catch (e, s) {
      Log().error(DuoException(e, stackTrace: s));
      emit(state.copyWith(status: HomeStateStatus.error));
    }
  }

  Future<void> _onDayChanged(
    HomeDayChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(selectedDay: event.day));
  }
}
