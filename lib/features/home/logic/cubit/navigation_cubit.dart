// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  changeIndex(int target) {
    
   
    emit(target);
    
  }
}
