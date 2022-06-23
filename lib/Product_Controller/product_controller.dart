import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopx_getx/Model/model.dart';
import 'package:shopx_getx/Service/api_service.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  void fetchProducts()async{
    try{
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products !=null ){
        productList.assignAll(products);
      }
    }
    finally{
      isLoading(false);
    }

  }

}