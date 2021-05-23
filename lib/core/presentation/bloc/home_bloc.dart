import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeIndexChange extends HomeEvent {
  final int index;

  HomeIndexChange({required this.index});

  @override
  List<Object> get props => [index];
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeIndexChange) {
      yield HomeIndexChanged(event.index);
    }
  }
}

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => ['HomeInitial'];
}

class HomeIndexChanged extends HomeState {
  final int index;

  HomeIndexChanged(this.index);

  @override
  List<Object> get props => [index];
}
