import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/data/product_details.dart';
import 'package:graduation_project/features/home/models/product_model.dart';

part 'product_state.dart';

class AllProductCubit extends Cubit<ProductState> {
  AllProductCubit() : super(ProductInitial());
  List<ProductDetailsModel>? productDetails;
  List<ProductDetailsModel> searchResults = [];
  TextEditingController searchProductController = TextEditingController();
  filterSearch({required String wantedProduct}) {
    emit(LoadingSearchResultsState());
    final res = productDetails
        ?.where(
          (element) => element.name.contains(wantedProduct),
        )
        .toList();
    searchResults.clear();
    searchResults.addAll(res ?? []);
    if (res!.isNotEmpty) {
      emit(LoadedSearchSuccessState());
    }
    emit(LoadedSearchEmptyState());
  }

  getProductDetails() async {
    try {
      emit(FetchingProductDetails());
      debugPrint('product cubit has entered');
      final List<dynamic> res = await ProductDetailsResFetcher.getData();
      productDetails = res.map((e) => ProductDetailsModel.fromJson(e)).toList();
      debugPrint('Hello all product cubit');
      debugPrint(productDetails.toString());
      emit(FetchingProductDetailsSuccess());
    } catch (e) {
      emit(FetchingProductDetailsError(error: e.toString()));
    }
  }
}
