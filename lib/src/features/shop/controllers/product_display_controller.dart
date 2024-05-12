import 'package:get/get.dart';
import '../../shop/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class DisplayController extends GetxController {
  Random random = Random();
  var productList = <ProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getProducts();
  }

  @override
  void onReady() async {
    super.onReady();
    await getProducts();
  }

  Future<void> getProducts() async {
    isLoading(true);
    try {      
      final url = Uri.parse('http://192.168.43.192:8000/get-products');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> res = jsonDecode(response.body);
        final List<dynamic> dynamicList = res['results'];
        final List<Map<String, dynamic>> products = dynamicList.map((product) => product as Map<String, dynamic>).toList();
        productList.clear();
        products.forEach((product) {
          productList.add(
            ProductModel(
              id: 1,
              productName: product['cosmeticName'],
              productPrice: random.nextInt(5001 - 3000) + 3000,
              productDescription:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              imgURL: 'assets/images/foundation-sample.jpg',
              brandName: product['cosmeticBrand'],
              shadeNames: [product['cosmeticShade']],
              productShade: product['cosmeticShade'],
              hexCodes: [0xFFFFDAAE],
              category: 'Face'
            )
          );
        });
      } else {
        print('Failed to get recommendations. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching recommendations: $e');
    } finally {
      isLoading(false);
    }
  }
}
