class CartItem {
  final String name;
  final int price;
  final int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}