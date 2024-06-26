import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly_priority_soft/features/cart/data/models/cart_model.dart';

import '../../data/models/add_to_cart_request_model.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/delete_cart_item.dart';
import '../../domain/usecases/get_cart_items.dart';
import '../../domain/usecases/update_cart_item.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart _addToCart;
  final GetCartItems _getCartItems;
  final DeleteCartItem _deleteCartItem;
  final UpdateCartItem _updateCartItem;
  final FirebaseAuth auth;

  CartBloc(this._addToCart, this._getCartItems, this._deleteCartItem,
      this._updateCartItem, this.auth)
      : super(const _Initial()) {
    on<CartEvent>((event, emit) async {
      String? userId = auth.currentUser?.uid;
      if (userId == null) {
        try {
          final newUser = await auth.signInAnonymously();
          userId = newUser.user?.uid;
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      if (userId == null) {
        emit(const CartState.error(errorMsg: "Unable to create user"));
        return;
      }
      await event.whenOrNull(
        getCartItems: () async {
          emit(const CartState.loading());

          final response = await _getCartItems(userId!);
          if (response.success) {
            emit(CartState.getCartItemssuccess(cartItems: response.data!));
          } else {
            emit(CartState.error(errorMsg: response.message));
          }
        },
        addToCart: (request) async {
          emit(const CartState.loading());
          final response = await _addToCart(request);
          if (response) {
            emit(const CartState.success('Added to cart successfully'));
          } else {
            emit(const CartState.error(errorMsg: 'Failed to add to cart'));
          }
        },
        deleteCartItem: (cartId) async {
          emit(const CartState.loading());
          final response = await _deleteCartItem(cartId);
          if (response) {
            emit(const CartState.success('Removed from cart successfully'));
          } else {
            emit(const CartState.error(errorMsg: 'Failed to remove from cart'));
          }
        },
        updateCartItem: (cartId, quantity) async {
          emit(const CartState.loading());
          final response = await _updateCartItem(cartId, quantity);
          if (response) {
            emit(const CartState.success('Cart updated successfully'));
          } else {
            emit(const CartState.error(errorMsg: 'Failed to update cart'));
          }
        },
      );
    });
  }
}
