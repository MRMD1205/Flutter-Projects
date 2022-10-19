import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';

class CartController extends GetxController {
  var cartProducts = <ProductModel>[].obs;

  int get cartItems => cartProducts.length;

  double get totalPrice =>
      cartProducts.fold(0, (sum, item) => sum + item.price);

  void addToCart(ProductModel product) {
    cartProducts.add(product);
  }
}
