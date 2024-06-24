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
