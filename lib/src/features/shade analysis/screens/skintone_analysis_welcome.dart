import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/shade%20analysis/screens/analysis_camera.dart';
import '../../../constants/constants.dart';
import '../controllers/analysis_camera_controller.dart';
import 'package:get/get.dart';
import 'analysis_camera.dart';

class SkinToneAnalysisWelcome extends StatelessWidget {
  SkinToneAnalysisWelcome({super.key});
  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 90,),
                Image(image: AssetImage('assets/images/welcome illustration.png'),),
                SizedBox(height: 20,),
                Text('Shade Analysis', style: kBoldBarbiePinkH1,),
                Text('This module of OptiGlam will help you find the perfect foundation shade by analyzing your skin-tone using artificial intelligence!', style: kSmall14Black, textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Text('All you need to do is submit 3 of your photos in the best lighting!', style: kSmall14BarbiePink, textAlign: TextAlign.center,),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(8),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(kBarbiePink),
                      ),
                      child: const Text("Open Camera", style: kSmall,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        imagePickerController.getImageFromGallery();
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(8),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(kBlack),
                      ),
                      child: const Text("Open Gallery", style: kSmall,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
