import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optiglamcustomer/src/features/undertone%20analysis/screens/quiz_result.dart';
import '../../../constants/constants.dart';
import '../controllers/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});
  final QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'Undertone Analysis',
              style: kBoldBarbiePinkH1,
            ),
            Text(
              'Just a few small, simple tests that help\nyou figure out your undertone.',
              style: kSmall14Grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: quizController.questionList.length,
                itemBuilder: (context, index) => QuizQuestionCard(index: index),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width:  MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: Obx(() =>  ElevatedButton(
                  onPressed: quizController.formFilled.value? (){
                    quizController.calculateUndertone();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizResult()));
                  } : null,
                  style: quizController.formFilled.value? ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(5),
                    shadowColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(kBlack),
                  ) : ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(5),
                    shadowColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(kBackgroundGrey),
                  ),
                  child: const Text("Submit", style: kSmall,),
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizQuestionCard extends StatelessWidget {
  QuizQuestionCard({
    super.key,
    required this.index,
  });
  final quizController = Get.find<QuizController>();
  final int index;
  int temp = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kBabyPink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizController.questionList[index].question!,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: kBlack,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Card(
                color: kWhite,
                surfaceTintColor: kWhite,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                          value: 1,
                          groupValue: quizController.answerList[index].value,
                          onChanged: (value) {
                            quizController.updateAnswerList(index, value!);
                            quizController.updateFormFilled();
                          },
                          fillColor:
                          MaterialStateProperty.all<Color>(kBarbiePink),
                        ),),
                        Text(
                          quizController.questionList[index].warmAns!,
                          style: kSmall14Black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                          value: 2,
                          groupValue: quizController.answerList[index].value,
                          onChanged: (value) {
                            quizController.updateAnswerList(index, value!);
                            quizController.updateFormFilled();
                          },
                          fillColor:
                          MaterialStateProperty.all<Color>(kBarbiePink),
                        ),),
                        Text(
                          quizController.questionList[index].coldAns!,
                          style: kSmall14Black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                          value: 3,
                          groupValue: quizController.answerList[index].value,
                          onChanged: (value) {
                            quizController.updateAnswerList(index, value!);
                            quizController.updateFormFilled();
                          },
                          fillColor:
                          MaterialStateProperty.all<Color>(kBarbiePink),
                        ),),
                        Text(
                          quizController.questionList[index].neutralAns!,
                          style: kSmall14Black,
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
    );
  }
}
