import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopx_getx/Product_Controller/product_controller.dart';

class HomeScreen extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Shopping Apps',
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children:[
                        Container(
                          height: 100,
                          width: 150,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              productController.productList[index].imageLink,
                              width: 150,
                              height: 100,
                             fit: BoxFit.fill,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  productController.productList[index].name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  productController.productList[index].brand,
                                  style: TextStyle(fontSize: 14,color: Colors.blueAccent),
                                ),
                                Text(
                                  productController.productList[index].category,
                                  style: TextStyle(fontSize: 14,color: Colors.grey),
                                ),

                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      color: Colors.grey[200],
                      height: 2,
                    )
                  ],
                );
              }
          );
         }
         )
    );
  }
}
