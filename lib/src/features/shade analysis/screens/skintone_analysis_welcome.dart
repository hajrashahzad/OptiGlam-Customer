import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/shade%20analysis/screens/preview_screen.dart';
import '../../../constants/constants.dart';
import '../controllers/image_picker_controller.dart';
import 'package:get/get.dart';

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
                const SizedBox(height: 90,),
                const Image(image: AssetImage('assets/images/welcome illustration.png'),),
                const SizedBox(height: 20,),
                const Text('Shade Analysis', style: kBoldBarbiePinkH1,),
                const Text('This module of OptiGlam will help you find the perfect foundation shade by analyzing your skin-tone using artificial intelligence!', style: kSmall14Black, textAlign: TextAlign.center,),
                const SizedBox(height: 30,),
                const Text('All you need to do is submit 3 of your photos in the best lighting!', style: kSmall14BarbiePink, textAlign: TextAlign.center,),
                const SizedBox(height: 100,),
                /*Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        imagePickerController.getImageFromCamera();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen()));
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
                ),*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        imagePickerController.getImageFromGallery();
                        debugPrint("Images gotten from gallery!");
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => CameraScreen()));
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(5),
                        shadowColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width:  MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: Obx(() => ElevatedButton(
                      onPressed: imagePickerController.isListEmpty.value ? null : () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => PreviewScreen()));
                      },
                      style: imagePickerController.isListEmpty.value ? ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(kWhite),
                      ) : ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(8),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(kBarbiePink),
                    ),
                      child: const Text("Next", style: kSmall),
                    ),),
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
