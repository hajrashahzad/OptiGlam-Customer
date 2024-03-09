import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../common widgets/custom_app_bar.dart';

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({super.key});

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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: kBackgroundGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: kGrey,
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.zero)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Name', style: kNormalBlack,),
                                    Text('Product Price', style: kSmallGrey,),
                                    Text('Product Details', style: kSmallGrey,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: kBackgroundGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: kGrey,
                                    borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.zero)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Name', style: kNormalBlack,),
                                    Text('Product Price', style: kSmallGrey,),
                                    Text('Product Details', style: kSmallGrey,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: kBackgroundGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: kGrey,
                                    borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.zero)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Name', style: kNormalBlack,),
                                    Text('Product Price', style: kSmallGrey,),
                                    Text('Product Details', style: kSmallGrey,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
