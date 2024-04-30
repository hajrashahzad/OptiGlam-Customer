import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/constants/constants.dart';
import 'package:optiglamcustomer/src/features/recommendations/screens/recommendations_screen.dart';
import 'package:optiglamcustomer/src/features/shade%20analysis/screens/skintone_analysis_welcome.dart';
import 'package:optiglamcustomer/src/features/try%20on/screens/filter_screen.dart';
import 'package:optiglamcustomer/src/features/undertone%20analysis/screens/undertone_quiz.dart';
import '../../../common widgets/custom_app_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: SearchBar(
                  hintText: 'Search...',
                  hintStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      color: kGrey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(kBackgroundGrey),
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.0),
                    child: Icon(
                      Icons.search_outlined,
                      color: kGrey,
                      size: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SkinToneAnalysisWelcome()));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBabyPink,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 230,
                        width: 158,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Shade Analyzer',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: kBlack,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
                              child: Text(
                                'Find your foundation shade with the help of our AI Tools!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kBarbiePink,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            FittedBox(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              fit: BoxFit.fitWidth,
                              child: Image(
                                width: 120,
                                height: 120,
                                image: AssetImage(
                                  'assets/images/girl_dashboard_1.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBabyPink,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 230,
                        width: 158,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Figure out your\nundertone!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: kBlack,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
                              child: Text(
                                'Don’t understand what looks good on you? We can help!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kBarbiePink,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            FittedBox(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              fit: BoxFit.fitWidth,
                              child: Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  'assets/images/girl_mirror_dashboard_2.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecommendationScreen()));
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kBabyPink,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 230,
                        width: 158,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Makeup Recommendations',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: kBlack,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
                              child: Text(
                                'Find the products that best fit you!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kBarbiePink,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            FittedBox(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              fit: BoxFit.fitWidth,
                              child: Image(
                                height: 130,
                                width: 150,
                                image: AssetImage(
                                  'assets/images/girl_makeup_dashboard_4.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
                },
                child: Container(
                  height: 192,
                  width: MediaQuery.of(context).size.width * 0.91,
                  decoration: BoxDecoration(
                    color: kBlack,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10,8,0,2),
                            child: Text(
                              'Virtual Try-On',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: kWhite
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Test out all the products you\nwant to buy from the comfort\nof your home!',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                                color: kWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                              '\n'
                          ),
                          FittedBox(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            fit: BoxFit.fitWidth,
                            child: Image(
                              width: 130,
                              height: 150,
                              image: AssetImage(
                                'assets/images/girl_makeup_dashboard_4.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Expert Advice',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                        fontSize: 24,
                      ),
                    ),
                    const Text('Our team has curated the best content out there to help you understand yourself better, and empower your beauty journey. ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: kGrey,
                        fontSize: 14,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0)
                            ),
                            child: Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: kBackgroundGrey,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0)
                            ),
                            child: Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: kBackgroundGrey,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0)
                            ),
                            child: Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: kBackgroundGrey,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 0)
                            ),
                            child: Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: kBackgroundGrey,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
