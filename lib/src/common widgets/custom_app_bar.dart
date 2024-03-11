import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/common%20controllers/common_controller.dart';
import 'package:optiglamcustomer/src/features/authentication/models/user_model.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
import '../constants/constants.dart';
import 'package:get/get.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                            style: TextStyle(
                              color: kBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          );
                        }
                        else {
                          return CircularProgressIndicator();
                        }
                      }
                      else {
                        return CircularProgressIndicator();
                      }
                    }
                  ),
                  Text(
                    'Good Morning',
                    style: TextStyle(
                      color: kBlack,
                      fontSize: 14,
                      fontFamily: 'Poppins',
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
                onPressed: () {},
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: kBarbiePink,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(),),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10),),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
                child: Icon(
                  Icons.logout_outlined,
                  color: kBarbiePink,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                  shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(),),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}