import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:optiglamcustomer/src/features/shade%20analysis/screens/skintone_analysis_welcome.dart';
import 'package:optiglamcustomer/src/features/undertone%20analysis/screens/undertone_quiz.dart';
class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.fieldValue,
    required this.leading,
  });
  final String fieldValue;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if (fieldValue  == 'Change Password') { return; }
        else if (fieldValue == 'Re-evaluate Skin Tone') { Navigator.push(context, MaterialPageRoute(builder: (context) => SkinToneAnalysisWelcome())); }
        else if (fieldValue == 'Re-evaluate Undertone') { Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen())); }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  leading,
                  color: kBarbiePink,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  fieldValue,
                  style: kNormalBlack,
                ),
              ],
            ),
            const Icon(
                Icons.chevron_right,
              color: kBlack,
            ),
          ],
        ),
      ),
    );
  }
}