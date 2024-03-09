import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      color: kWhite,
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: kBackgroundGrey,
            ),
          ),
          Text(
            'User\'s Name',
            style: TextStyle(
              color: kBlack,
            ),
          ),
          Text('Personal Information', style: kH3Black,),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kBabyPink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: abcd@gmail.com', style: kNormalBarbiePink,),
                  Text('Phone Number: 92 XXX XXXXXX', style: kNormalBarbiePink,),
                  Text('Location: ..', style: kNormalBarbiePink,),
                ],
              ),
            ),
          ),
          Text('Skin Tone Related Information', style: kH3Black,),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kBabyPink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skin Tone: 6', style: kNormalBarbiePink,),
                  Text('Undertone: warm', style: kNormalBarbiePink,),
                  Text('Recommended Foundations: ..', style: kNormalBarbiePink,),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
