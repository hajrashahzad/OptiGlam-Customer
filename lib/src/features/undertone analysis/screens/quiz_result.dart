import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../controllers/quiz_controller.dart';

class QuizResult extends StatelessWidget {
  QuizResult({super.key});
  final quizController = Get.put(QuizController());
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
                      'Undertone Analysis Result ',
                      style: kRegularBlackH2,
                    ),
                    const Text(
                      'Congratulations on completing the quiz! Based on your responses, here\'s your undertone analysis:',
                      style: kSmall14Grey,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: kBabyPink,
                        border: Border.all(color: kBarbiePinkTransparent, width: 20),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Center(
                        child: Text(quizController.undertone.value, style: TextStyle(fontFamily: 'Poppins', color: kBarbiePink, fontWeight: FontWeight.bold, fontSize: 32, decoration: TextDecoration.none),),
                      ),
                    ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Understanding your undertone can help you choose makeup, clothing, and accessories that enhance your natural beauty. Embrace your unique undertone and explore styles that make you feel confident and radiant!', style: kSmall14Black, textAlign: TextAlign.justify,),
                    ),
                    const SizedBox(height: 20,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('For your understanding!', style: kRegularBarbiePinkH5,),
                        SizedBox(height: 10,),
                        Text('Warm Undertones', style: kSmall14Black, textAlign: TextAlign.left,),
                        Text('You have warm undertones if you answered mostly yes to questions about gold jewelry, and if warm colors like red, orange, and yellow complement your skin best. Your undertone likely has a golden or peachy hue, giving you a natural warmth.', style: kSmall12Grey, textAlign: TextAlign.left,),
                        SizedBox(height: 10,),
                        Text('Cool Undertones', style: kSmall14Black, textAlign: TextAlign.left,),
                        Text('If you answered mostly yes to questions about silver jewelry and if cool colors like blue, purple, and green enhance your complexion, you likely have cool undertones. Your skin may have hints of pink, blue, or purple, giving you a cool and fresh appearance.', style: kSmall12Grey, textAlign: TextAlign.left,),
                        SizedBox(height: 10,),
                        Text('Neutral Undertones', style: kSmall14Black, textAlign: TextAlign.left,),
                        Text('If your answers were a mix of yes and no to questions about jewelry and color preferences, you likely have a neutral undertone. Your skin can pull off both warm and cool colors, and you may not notice a significant preference for either gold or silver jewelry.', style: kSmall12Grey, textAlign: TextAlign.left,),
                      ],
                    ),
                    SizedBox(height:20,),
                    const Image(image: AssetImage('assets/images/undertone chart.png'),),
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
