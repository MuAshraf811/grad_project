import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../home/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  num totalAmount = 0;
  final List<ProductDetailsModel> cartList = [];
  calculateTotalAmount() {
    totalAmount = 0;
    for (int i = 0; i <= cartList.length - 1; i++) {
      totalAmount = cartList[i].price + totalAmount;
    }
    ;
  }

  addElementToCart(ProductDetailsModel element) {
    emit(LoadingCartChangeState());
    cartList.add(element);
    debugPrint(cartList.toString());
    emit(AddItemToCartState());
  }

  RemoveElementFromCart(int element) {
    emit(LoadingCartChangeState());
    cartList.removeAt(element);
    emit(RemoveItemFromCartState());
  }
}
