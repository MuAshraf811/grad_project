part of 'offers_cubit.dart';

sealed class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}

final class OffersInitial extends OffersState {}

final class FetchingProductDiscount extends OffersState {}

final class FetchingProductDescountSuccess extends OffersState {}

final class FetchingProductDiscountError extends OffersState {
  final String error;
  const FetchingProductDiscountError({required this.error});
}
