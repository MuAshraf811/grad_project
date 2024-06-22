import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/home/data/discount.dart';
import 'package:graduation_project/features/home/models/product_discount.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  List<ProductDiscountModel>? productDiscount;
  getProductDiscount() async {
    try {
      emit(FetchingProductDiscount());
      final List<dynamic> res = await DiscountDataFetcher.getData();

      productDiscount =
          res.map((e) => ProductDiscountModel.fromJson(e)).toList();
      emit(FetchingProductDescountSuccess());
    } catch (e) {
      emit(FetchingProductDiscountError(error: e.toString()));
    }
  }
}
