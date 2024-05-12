import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/recommendations/screens/recommendations_screen.dart';
import '../../../constants/constants.dart';

class SkinToneAnalysisResult extends StatelessWidget {
  SkinToneAnalysisResult({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kBabyPink,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Skin tone Analysis Result ',
                      style: kRegularBlackH2,
                    ),
                    const Text(
                      'Your images have been successfully analyzed! Based on your submissions, here\'s your MST skintone value:',
                      style: kSmall14Grey,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: kBabyPink,
                        border: Border.all(color: kBarbiePinkTransparent, width: 20),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Center(
                        child: Text('3', style: TextStyle(fontFamily: 'Poppins', color: kBarbiePink, fontWeight: FontWeight.bold, fontSize: 32, decoration: TextDecoration.none),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text('The basic MST scale (10 (Left) to 1 (Right)):', style: kSmall14Black,),
                    Image(image: AssetImage('assets/images/mst scale.png'),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecommendationScreen()));
                    }, child: Text('Go to recommendations page',style: TextStyle(color: kBarbiePink, fontFamily: 'Poppins', decoration: TextDecoration.none),)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
