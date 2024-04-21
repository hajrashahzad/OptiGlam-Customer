import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/constants/constants.dart';
import '../controllers/analysis_camera_controller.dart';
/*class CameraScreen extends StatelessWidget {
  CameraScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagePickerController>(
      init: ImagePickerController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: kWhite,
          ),
        ),
      ),
    );
  }
}*/
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  late ImagePickerController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<ImagePickerController>();
    controller.getImageFromCamera();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(color: kWhite,),);
  }
}
