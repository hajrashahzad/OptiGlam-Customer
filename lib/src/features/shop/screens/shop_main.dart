import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/features/shop/screens/product_display.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';
class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: kWhite,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDisplay(category: 'Face')));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: const Row(
                              children: [
                                Icon(Icons.face, color: kBarbiePink,),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Face', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDisplay(category: 'Eyes')));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: const Row(
                              children: [
                                Icon(Icons.remove_red_eye_outlined, color: kBarbiePink,),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Eyes', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDisplay(category: 'Lips')));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: const Row(
                              children: [
                                Icon(Icons.light, color: kBarbiePink,),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Lips', style: kNormalBarbiePink,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDisplay(category: 'Other')));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width *0.85,
                            height: 100,
                            child: const Row(
                              children: [
                                Icon(Icons.mood_sharp, color: kBarbiePink,),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
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