import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ProfileInformationContainer extends StatelessWidget {
  ProfileInformationContainer({super.key, required this.fieldTitle, required this.value, required this.icon});
  String fieldTitle;
  String value;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fieldTitle, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, color: kBarbiePink),),
              Text(value, style: kNormalBlack, overflow: TextOverflow.ellipsis,),
            ],
          ),
        ],
      ),
    );
  }
}