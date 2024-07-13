part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class LoadingCartChangeState extends CartState {}

final class AddItemToCartState extends CartState {}

final class RemoveItemFromCartState extends CartState {}

final class FetchingCartItems extends CartState {}

final class FetchingCartItemsSuccess extends CartState {}

final class FetchingCartItemsError extends CartState {
  final String errorMessage;

  FetchingCartItemsError({required this.errorMessage});
}

final class PostingDataToServer extends CartState {}

final class PostingDataToServerSuccess extends CartState {
  PostingDataToServerSuccess();
}

final class PostingDataToServerError extends CartState {
  final String error;

  PostingDataToServerError({required this.error});
}

final class DeletingOrder extends CartState {}

final class DeletingOrderSuccess extends CartState {}

final class DeletingOrderError extends CartState {
  final String error;

  DeletingOrderError({required this.error});
}

final class NewTotalPriceLoadingState extends CartState {}

final class NewTotalPriceCurrentState extends CartState {}
