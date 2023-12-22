import 'package:flutter/material.dart';
import 'package:optiglamcustomer/constants.dart';

void main() {
  runApp(const OptiGlamCustomer());
}

class OptiGlamCustomer extends StatelessWidget {
  const OptiGlamCustomer({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          ),
          bodyLarge: TextStyle(
            color: kBlack,
          ),
          bodySmall: TextStyle(
            color: kBlack,
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
          ),
          bodyLarge: TextStyle(
            color: kWhite,
          ),
          bodySmall: TextStyle(
            color: kWhite,
          ),
        ),
      ),
    );
  }
}


