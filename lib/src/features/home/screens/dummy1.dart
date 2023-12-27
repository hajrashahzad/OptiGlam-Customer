import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/home/screens/dummy3.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
class DummyOne extends StatelessWidget {
  const DummyOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: kWhite,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: SearchBar(
                    hintText: 'Search...',
                    hintStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        color: kGrey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(kBackgroundGrey),
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Icon(
                        Icons.search_outlined,
                        color: kGrey,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kBabyPink,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDisplay()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: Row(
                              children: [
                                Icon(Icons.face, color: kBarbiePink,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Face', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: Row(
                              children: [
                                Icon(Icons.remove_red_eye_outlined, color: kBarbiePink,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Eyes', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: Row(
                              children: [
                                Icon(Icons.light, color: kBarbiePink,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Lips', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Container(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: Row(
                              children: [
                                Icon(Icons.mood_sharp, color: kBarbiePink,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Other', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}