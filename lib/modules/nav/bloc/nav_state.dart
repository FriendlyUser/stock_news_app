part of 'nav_bloc.dart';

@immutable
abstract class NavBlocState extends Equatable {
  // cubit to represent state of navbar
  // 0 is open and 1 is closed
  final int isDrawerOpen;
  final int currentPage;  

  NavBlocState(this.isDrawerOpen, this.currentPage);

  @override
  List<Object> get props => [isDrawerOpen, currentPage];
}

class NavBlocInitial extends NavBlocState { 
  NavBlocInitial(int isDrawerOpen, int currentPage): super(isDrawerOpen, currentPage);
}

class NavBlocClose extends NavBlocState {

  NavBlocClose(int isDrawerOpen, int currentPage): super(1, currentPage);
}

class NavBlocOpen extends NavBlocState {

  NavBlocOpen(int isDrawerOpen, int currentPage): super(0, currentPage);
}