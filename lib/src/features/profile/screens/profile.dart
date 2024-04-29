import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/profile_information_container.dart';
import '../../../common widgets/settings_button.dart';

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
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
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
                          image: const DecorationImage(
                            image: AssetImage('assets/images/user_profile.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            color: kBarbiePink,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Personal Information',
                  style: kRegularBlackH1,
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: const BoxDecoration(
                    color: kBackgroundGrey,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Column(
                    children: [
                      ProfileInformationContainer(
                        fieldTitle: 'Name',
                        value: 'Hajra Shahzad',
                        icon: Icons.person,
                      ), //Information from db
                      ProfileInformationContainer(
                        fieldTitle: 'Email Address',
                        value: 'hajrashahzad24@gmail.com',
                        icon: Icons.email,
                      ), //TODO: fix text overflow here
                      ProfileInformationContainer(
                          fieldTitle: 'Phone Number',
                          value: '03XX-XXXXXXXX',
                          icon: Icons.phone),
                      ProfileInformationContainer(
                          fieldTitle: 'MST Skin Tone Value',
                          value: '3',
                          icon: Icons.face),
                      ProfileInformationContainer(
                          fieldTitle: 'Undertone',
                          value: 'Warm',
                          icon: Icons.color_lens),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Settings',
                  style: kRegularBlackH1,
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: const BoxDecoration(
                    color: kBackgroundGrey,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Column(
                    children: [
                      SettingsButton(
                        fieldValue: 'Change Username',
                        leading: Icons.person_outlined,
                      ),
                      SettingsButton(
                        fieldValue: 'Change Password',
                        leading: Icons.lock_outline,
                      ),
                      SettingsButton(
                        fieldValue: 'Re-evaluate Skin Tone',
                        leading: Icons.face_2,
                      ),
                      SettingsButton(
                        fieldValue: 'Re-evaluate Undertone',
                        leading: Icons.color_lens_outlined,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
