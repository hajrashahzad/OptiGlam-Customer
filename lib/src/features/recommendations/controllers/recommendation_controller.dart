import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/authentication/models/user_model.dart';
import '../../shop/models/product_model.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
import 'package:optiglamcustomer/src/repository/user_repository/user_repository.dart';
import 'dart:math';

class RecommendationController extends GetxController {
  final AuthenticationRepository _authRepo = Get.find();
  final UserRepository _userRepo = Get.find();
  Random random = Random();
  var productList = <ProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getRecommendations();
  }

  @override
  void onReady() async {
    super.onReady();
    await getRecommendations();
  }

  Future<void> getRecommendations() async {
    isLoading(true);
    try {
      final email = _authRepo.firebaseUser.value?.email;
      if (email != null) {
        UserModel userData = await _userRepo.getUserDetails(email);
        Map<String, dynamic> payload = {'skintone': userData.mstSkintone};

        final url = Uri.parse('http://192.168.43.192:8000/get-recommendations');
        final response = await http.post(
          url,
          body: jsonEncode(payload),
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
      }
    } catch (e) {
      print('Error fetching recommendations: $e');
    } finally {
      isLoading(false);
    }
  }
}
