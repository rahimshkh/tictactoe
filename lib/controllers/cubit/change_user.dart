import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeUserCubit extends Cubit<bool> {
  ChangeUserCubit() : super(true);

  switchUser() {
    emit(!state);
  }
}
