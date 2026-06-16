import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project26/features/cart/domain/cart_model.dart';


class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addItem(CartItem item) {
    final index = state.indexWhere((e) => e.name == item.name);

    if (index != -1) {
      state = [
        for (final current in state)
          if (current.name == item.name)
            CartItem(
              name: current.name,
              price: current.price,
              quantity: current.quantity + 1,
            )
          else
            current,
      ];
    } else {
      state = [...state, item];
    }
  }

  void increase(String name) {
    state = [
      for (final item in state)
        if (item.name == name)
          CartItem(
            name: item.name,
            price: item.price,
            quantity: item.quantity + 1,
          )
        else
          item
    ];
  }

  void decrease(String name) {
    state = [
      for (final item in state)
        if (item.name == name && item.quantity > 1)
          CartItem(
            name: item.name,
            price: item.price,
            quantity: item.quantity - 1,
          )
        else
          item
    ];
  }

  void remove(String name) {
    state = state.where((item) => item.name != name).toList();
  }

  int get totalPrice {
    return state.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);