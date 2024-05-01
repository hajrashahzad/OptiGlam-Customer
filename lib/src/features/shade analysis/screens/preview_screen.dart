import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import 'dart:io';
import '../controllers/image_picker_controller.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({super.key});
  //ImagePickerController imagePickerController = Get.put(ImagePickerController());
  final imagePickerController = Get.find<ImagePickerController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Preview',
                style: kBoldBarbiePinkH1,
              ),
              const Text(
                'Make sure you have selected\nat least 3 images!',
                style: kSmall14Grey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: imagePickerController.itemCount.value,
                    itemBuilder: (context, index) => ImageDisplayCard(
                      img: imagePickerController.imagesList.value[index].image,
                      index: index,
                      onPressed: () {
                        imagePickerController.removeImage(index);
                        debugPrint("cross button pressed");
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: kBackgroundGrey,
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: () {
                        imagePickerController.appendToImageList();
                      },
                      child: const Icon(
                        Icons.add,
                        color: kBarbiePink,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      'Add Image',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100,
                          fontSize: 9,
                          color: kGrey,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:
                          imagePickerController.isLengthGreaterThan3.value
                              ? () {}
                              : null,
                      style: imagePickerController.isLengthGreaterThan3.value
                          ? ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(5),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  kBackgroundGrey),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kBarbiePink),
                            )
                          : ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  kBackgroundGrey),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kBabyPink),
                            ),
                      child: const Text(
                        "Next",
                        style: kSmall,
                      ),
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

class ImageDisplayCard extends StatelessWidget {
  ImageDisplayCard({
    super.key,
    required this.img,
    required this.onPressed,
    this.lightingCondition,
    required this.index,
  });
  final imagePickerController = Get.find<ImagePickerController>();
  final File img;
  final void Function() onPressed;
  int index;
  bool? lightingCondition;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: kBackgroundGrey,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kGrey,
                  offset: Offset.fromDirection(7),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onPressed,
                    child: const Icon(
                      Icons.cancel_outlined,
                      color: kBarbiePink,
                    ),
                  ),
                  Image(
                    image: FileImage(img),
                  ),
                  const SizedBox(height: 5,),
                  const Text('Please select the lighting Conditions of this image:', style: kSmall14Grey,),
                  Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Obx(() => Radio(
                              value: true, //bool
                              groupValue: imagePickerController.lightingConditionList[index].value,//imagePickerController.imagesList.value[index].goodLight, //bool
                              onChanged: (value){
                                imagePickerController.updateLightingConditionAtIndex(value!, index);
                              },
                            ),),
                            const Text(
                              'good',
                              style: kNormalBlack,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(() => Radio(
                              value: false,
                              groupValue:  imagePickerController.lightingConditionList[index].value, //bool
                              onChanged: (value){
                                imagePickerController.updateLightingConditionAtIndex(value!, index);
                              },
                            ),),
                            const Text(
                              'poor',
                              style: kNormalBlack,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}



