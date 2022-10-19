import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';

class ShoppingItemsPageController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    await Future.delayed(Duration(seconds: 2));
    var productResult = [
      ProductModel(
          1, 'First Product', 'Image 1', 'First Product Description', 1000),
      ProductModel(
          2, 'Second Product', 'Image 2', 'Second Product Description', 2000),
      ProductModel(
          3, 'Third Product', 'Image 3', 'Third Product Description', 3000),
      ProductModel(
          4, 'Fourth Product', 'Image 4', 'Fourth Product Description', 4000),
    ];

    products.value = productResult;
  }
}
