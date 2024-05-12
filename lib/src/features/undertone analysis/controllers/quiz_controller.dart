import 'package:get/get.dart';
import '../models/quiz_models.dart';

class QuizController extends GetxController{
  static QuizController get find => Get.find();
  List<Question> questionList = [];
  List<RxInt> answerList = [0.obs, 0.obs, 0.obs, 0.obs];
  RxBool formFilled = false.obs;
  int warm = 0;
  int cool = 0;
  int neutral = 0;
  RxString undertone = 'Warm'.obs;
  void setQuestions(){
    questionList.add(Question(question: 'What kind of jewellery suits you best?', warmAns: 'Gold', coldAns: 'Silver', neutralAns: 'Both'),);
    questionList.add(Question(question: 'What color brings out your skin tone more?', warmAns: 'White', coldAns: 'Cream', neutralAns: 'Both'),);
    questionList.add(Question(question: 'What is the color of your veins?', warmAns: 'Blue/Purple', coldAns: 'Green', neutralAns: 'Greenish/Blue'),);
    questionList.add(Question(question: 'What color of hair dye would suit you more?', warmAns: 'Mahogany/Deep Brown', coldAns: 'Platinum/Ash Blonde', neutralAns: 'Both Mahogany and Ash Blonde'),);
  }
  @override
  void onInit(){
    super.onInit();
    setQuestions();
  }
  void updateAnswerList(int index, int val){
    answerList[index].value = val;
  }
  void updateFormFilled(){
    formFilled.value = true;
    for(var i =0;i<answerList.length; i++){
      if(answerList[i].value == 0){
        formFilled.value = false;
        break;
      }
    }
  }
  void calculateUndertone(){
    for(var i =0;i<answerList.length; i++){
      if(answerList[i].value == 1){
        warm++;
      }
      else if (answerList[i].value == 2){
        cool++;
      }
      else if (answerList[i].value == 3){
        neutral++;
      }
    }
    if(warm > cool && warm > neutral ){
      undertone.value = 'Warm';
    }
    else if (cool > warm && cool > neutral){
      undertone.value = 'Cool';
    }
    else if (neutral > warm && neutral > cool){
      undertone.value = 'Neutral';
    }
    warm = 0; cool = 0; neutral = 0;
  }
}