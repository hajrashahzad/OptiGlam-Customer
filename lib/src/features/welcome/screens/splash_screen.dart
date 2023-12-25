import 'package:flutter/material.dart';
import '../../../../src/constants/image_strings.dart';
import '../../../../src/constants/constants.dart';
import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kWhite,
          child: Stack(
            children: [
              Positioned(
                  top:  MediaQuery.of(context).size.height * 0.35 ,
                  left: MediaQuery.of(context).size.width * 0.2  ,
                  child: Obx(
                      () => AnimatedOpacity(
                      duration: const Duration(milliseconds: 2000),
                      opacity: splashScreenController.animate.value? 1 : 0,
                      child: const Image(
                        image: AssetImage(kLogoFile),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
