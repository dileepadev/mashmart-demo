import 'package:get/state_manager.dart';
import 'package:mashmart/models/product_model.dart';
import 'package:mashmart/services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Data>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var result = await ApiService.fetchProducts();
      if (result != null) {
        products.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }
}