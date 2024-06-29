import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/cart/data/get_orders.dart';
import 'package:graduation_project/features/cart/data/post_cart.dart';
import 'package:graduation_project/features/cart/model/cart_model.dart';

import '../../home/models/product_model.dart';
import '../data/delete_order.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  num totalAmount = 0;
  final List<ProductDetailsModel> cartList = [];
  List<CartModel> cartListFromDataBase = [];

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

  RemoveElementFromCart(String itemId) {
    emit(LoadingCartChangeState());
    final index =
        cartListFromDataBase.indexWhere((element) => element.itemId == itemId);
    cartListFromDataBase.removeAt(cartListFromDataBase.length - index - 1);
    emit(FetchingCartItemsSuccess());
  }

  deleteOrder(String itemId) async {
    try {
      emit(DeletingOrder());
      final res = await DeleteOrderFromServer.DeleteOrder(itemId: itemId);
      res.statusCode == 204
          ? await getCartItemFromDataBase()
          : emit(DeletingOrderError(error: res.message));
    } catch (e) {
      emit(DeletingOrderError(error: e.toString()));
    }
  }

  postCartData({
    required String productId,
    required String cartId,
    required int quantity,
  }) async {
    try {
      emit(PostingDataToServer());

      final res = await CartPostDataToServer.postCartItems(
          productId: productId, cartId: cartId, quantity: quantity);

      emit(PostingDataToServerSuccess());

      if (res.statusCode == 400) {
        emit(PostingDataToServerError(error: 'Item already Exists in Cart'));
      }
    } catch (e) {
      emit(PostingDataToServerError(error: 'Item already Exists in Cart'));
    }
  }

  getCartItemFromDataBase() async {
    try {
      emit(FetchingCartItems());
      final res = await ItemsCartCall.getCartItems();
      cartListFromDataBase = res
          .map(
            (e) => CartModel.fromJson(e),
          )
          .toList();

      emit(FetchingCartItemsSuccess());
    } catch (e) {
      emit(FetchingCartItemsError(errorMessage: e.toString()));
    }
  }
}
