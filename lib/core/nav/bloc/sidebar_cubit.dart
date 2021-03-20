import 'package:bloc/bloc.dart';


// cubit to represent state of navbar
// 0 is
class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);

  // set state to 1
  void openDrawer() => emit(0);

  // set state to 0
  void closeDrawer() => emit(1);
}