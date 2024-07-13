part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class FetchingProductDetails extends ProductState {}

final class FetchingProductDetailsSuccess extends ProductState {}

final class FetchingProductDetailsError extends ProductState {
  final String error;
  const FetchingProductDetailsError({required this.error});
}

final class LoadingSearchResultsState extends ProductState {}

final class LoadedSearchSuccessState extends ProductState {}

final class LoadedSearchEmptyState extends ProductState {}
