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
              SizedBox(
                height: 5,
              ),
              Text(
                'Preview',
                style: kBoldBarbiePinkH1,
              ),
              Text(
                'Make sure you have selected\nat least 3 images!',
                style: kSmall14Grey,
                textAlign: TextAlign.center,
              ),
              SizedBox(
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
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: kBackgroundGrey,
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: () {
                        imagePickerController.appendToImageList();
                      },
                      child: Icon(
                        Icons.add,
                        color: kBarbiePink,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
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
              SizedBox(
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
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onPressed,
                    child: Icon(
                      Icons.cancel_outlined,
                      color: kBarbiePink,
                    ),
                  ),
                  Image(
                    image: FileImage(img),
                  ),
                  SizedBox(height: 5,),
                  Text('Please select the lighting Conditions of this image:', style: kSmall14Grey,),
                  Obx(() => Column(
                    children: [
                      Card(
                        child: Row(
                          children: [
                            Radio(
                              value: imagePickerController.imagesList.value[index].condition[0],
                              groupValue: imagePickerController.imagesList.value[index].goodLight,
                              onChanged: (value){
                                imagePickerController.updateLightingConditionAtIndex(value!, index);
                              },
                            ),
                            Text(
                              'good',
                              style: kNormalBlack,
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Row(
                          children: [
                            Radio(
                              value: imagePickerController.imagesList.value[index].condition[1],
                              groupValue: imagePickerController.imagesList.value[index].goodLight,
                              onChanged: (value){
                                imagePickerController.updateLightingConditionAtIndex(value!, index);
                              },
                            ),
                            Text(
                              'poor',
                              style: kNormalBlack,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
/*class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  List<Widget> imgCardList = [];
  void updateImageCardList() {
    imgCardList = [];
    for (var i = 0; i < imagePickerController.imagesList.length; i++) {
      debugPrint("\n\n${imagePickerController.imagesList.length}\n");
      imgCardList.add(
          ImageDisplayCard(img: imagePickerController.imagesList[i]));
    }
  }
  @override
  Widget build(BuildContext context) {
    if (imagePickerController.imagesList != null) {
      updateImageCardList();
      return SafeArea(
        child: Container(
          color: kWhite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Preview',
                    style: kBoldBarbiePinkH1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: imgCardList,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              updateImageCardList();
                            });
                          },
                          child: Icon(Icons.camera_alt_outlined)),
                      TextButton(onPressed: () {}, child: Icon(Icons.image)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (imagePickerController == null) {
      return SafeArea(
        child: Container(
          color: kWhite,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Preview',
                    style: kBoldBarbiePinkH1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'No images taken yet!',
                    style: kRegularGreyH2,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else
      return const Placeholder();
  }
}*/
