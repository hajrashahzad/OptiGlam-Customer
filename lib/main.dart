import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/constants/constants.dart';
import 'package:optiglamcustomer/src/repository/authentication_repository/authentication_repository.dart';
import 'src/features/welcome/screens/landing_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const OptiGlamCustomer());
}

class OptiGlamCustomer extends StatelessWidget {
  const OptiGlamCustomer({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kWhite,
        primaryColor: kBabyPink,
        highlightColor: kBabyPink,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kBlack),
            foregroundColor: MaterialStateProperty.all<Color>(kWhite),
            shadowColor: MaterialStateProperty.all<Color>(kShadowColor),
          )
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: kBlack,
            fontFamily: 'Poppins',
          ),
          bodyLarge: TextStyle(
            color: kBlack,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            color: kBlack,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kBlack,
        primaryColor: kBabyPink,
        highlightColor: kBabyPink,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kBarbiePink),
              foregroundColor: MaterialStateProperty.all<Color>(kWhite),
              shadowColor: MaterialStateProperty.all<Color>(kShadowColor),
            ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          bodyLarge: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}


