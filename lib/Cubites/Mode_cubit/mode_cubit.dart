import 'package:bloc/bloc.dart';

class ModeCubit extends Cubit<bool> {
  ModeCubit() : super(false);
  void Changemode() {
    emit(state != true);
  }
}
