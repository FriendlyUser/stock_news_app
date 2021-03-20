part of 'nav_bloc.dart';

// @immutable
abstract class NavBlocEvent {
  const NavBlocEvent();

  @override
  List<Object> get props => [];
}

// might not need a variable
class NavDrawerClose extends NavBlocEvent {
  final int isDrawerOpen;
  final int pageNumber;
  const NavDrawerClose(this.isDrawerOpen, this.pageNumber);
}

class NavDrawerOpen extends NavBlocEvent {
  final int isDrawerOpen;
  final int pageNumber;
  const NavDrawerOpen(this.isDrawerOpen, this.pageNumber);
}
