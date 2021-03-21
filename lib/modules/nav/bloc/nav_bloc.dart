import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavBlocEvent, NavBlocState> {
  NavBloc() : super(NavBlocInitial(0, 0));

  @override
  Stream<NavBlocState> mapEventToState(
    NavBlocEvent event,
  )  async* {
     if (event is NavDrawerClose) {
      yield NavBlocClose(0, event.pageNumber);
    } else if (event is NavDrawerOpen) {
      yield NavBlocOpen(1, event.pageNumber);
    } else if (event is NavSetPageNumber) {
      yield NavSetPage(event.isDrawerOpen, event.pageNumber);
    }
  }
}
