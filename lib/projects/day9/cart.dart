import 'model/product.dart';

class CartStore {
  static final CartStore _instance = CartStore._internal();
  factory CartStore() => _instance;
  CartStore._internal();

  final List<Product> _cartItems = [];

  List<Product> get items => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
  }

  void clearCart() {
    _cartItems.clear();
  }

  double getTotalPrice() {
    double total = 0;
    for (var p in _cartItems) {
      total += (p.price is int) ? (p.price as int).toDouble() : (p.price as double);
    }
    return total;
  }
}