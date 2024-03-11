import 'package:flutter/material.dart';
import '../constants/constants.dart';
class SettingsButton extends StatelessWidget {
  SettingsButton({
    super.key,
    required this.fieldValue,
    required this.leading,
  });
  final String fieldValue;
  final IconData leading;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
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