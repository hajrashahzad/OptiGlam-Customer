import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/common%20controllers/common_controller.dart';
import '../constants/constants.dart';
import '../features/shop/screens/cart.dart';
import 'package:optiglamcustomer/src/features/authentication/models/user_model.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/images/user_profile.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: controller.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModel userData = snapshot.data as UserModel;
                          return Text(
                             'Hello, ${userData.fullName}!',
                            style: const TextStyle(
                              color: kBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          );
                        }
                        else {
                          return const CircularProgressIndicator();
                        }
                      }
                      else {
                        return const CircularProgressIndicator();
                      }
                    }
                  ),
                  const Text(
                    'Good Morning',
                    style: TextStyle(
                      color: kBlack,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                  shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder(),),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10),),
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: kBarbiePink,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                  shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder(),),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10),),
                ),
                child: const Icon(
                  Icons.logout_outlined,
                  color: kBarbiePink,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}