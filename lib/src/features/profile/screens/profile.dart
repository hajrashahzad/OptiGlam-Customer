import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
import '../../../common widgets/profile_information_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: kWhite,
        child: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 75,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: 170,
                    decoration: BoxDecoration(
                      color: kBlack,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  Positioned(
                      top: -45,
                      left: 25,
                      child: Container(
                        width: 106,
                        height: 106,
                        decoration: BoxDecoration(
                            color: kBarbiePink,
                            image: DecorationImage(
                              image: AssetImage('assets/images/user_profile.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              color: kBarbiePink,
                              width: 2.0,
                            )),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Personal Information',
                style: kRegularBlackH1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                  color: kBackgroundGrey,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    ProfileInformationContainer(fieldTitle: 'Name', value: 'Hajra Shahzad', icon: Icons.person,), //Information from db
                    ProfileInformationContainer(fieldTitle: 'Email Address', value: 'hajrashahzad24@gmail.com', icon: Icons.email,) //TODO: fix text overflow here
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Settings',
                style: kRegularBlackH1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: 300,
                decoration: BoxDecoration(
                  color: kBackgroundGrey,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


