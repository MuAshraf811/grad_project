import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';

class ThemeCubit extends Cubit<int> {
  ThemeCubit() : super(0);

  getThemeState(bool val) {
    if (SharedPreferencesManager.getIntVal()==1) {
      emit(1);
    } else {
      emit(0);
    }
  }
}
