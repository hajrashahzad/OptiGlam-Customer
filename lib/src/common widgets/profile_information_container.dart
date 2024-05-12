import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:optiglamcustomer/src/common%20controllers/common_controller.dart';
import 'package:optiglamcustomer/src/features/authentication/models/user_model.dart';
import 'package:get/get.dart';

class ProfileInformationContainer extends StatelessWidget {
  const ProfileInformationContainer({super.key, required this.fieldTitle, required this.icon});
  final String fieldTitle;
  final IconData icon;

  getFieldValue(String key, UserModel userData) {
    if (key == 'Name') { return userData.fullName; }
    else if (key == 'Email Address') { return userData.email; }
    else if (key == 'Phone Number') { return userData.phone; }
    else if (key == 'MST Skin Tone Value') { return userData.mstSkintone; }
    else if (key == 'Undertone') { return userData.undertone; }    
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonController());
    return FutureBuilder(
      future: controller.getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            UserModel userData = snapshot.data as UserModel;
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fieldTitle, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, color: kBarbiePink),),
                      Text(getFieldValue(fieldTitle, userData), style: kNormalBlack, overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ],
              ),
            );                         
          }
          else {
            return const CircularProgressIndicator();
          }
        }
        else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}