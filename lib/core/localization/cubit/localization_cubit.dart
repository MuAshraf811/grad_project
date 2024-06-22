import 'package:bloc/bloc.dart';

class LocalizationCubit extends Cubit<int> {
  LocalizationCubit() : super(0);
  getInt(int indx) {
    emit(indx);
  }
}
