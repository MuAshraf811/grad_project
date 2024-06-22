import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:graduation_project/features/home/data/category.dart';
import 'package:graduation_project/features/home/models/category_model.dart';
part 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit() : super(HomeBlocInitial());
  late List<CategoriesModel> categoryData;

  getCategroiesData() async {
    emit(FetchingCategoryData());
    try {
      final List<dynamic> response = await CategoryDataFetcher.getData();

      debugPrint(response.toString());
      categoryData = response.map((e) => CategoriesModel.fromJson(e)).toList();

      emit(CategoryDataFetchedSuccess());
    } catch (e) {
      emit(FetchingCategoryDataError(error: e.toString()));
    }
  }
}
