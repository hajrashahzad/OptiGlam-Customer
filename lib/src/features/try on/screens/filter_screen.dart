import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../controllers/filter_controller.dart';
import 'package:get/get.dart';
import 'ar_preview.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          color: kWhite,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: SingleChildScrollView(
            child: const Column(
              children: [
                Text('Avaialable Filters', style: kBoldBarbiePinkH1,),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FilterShadeCard(foundationColor: Color(0xFFFFDAAE), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterFFDAAE.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFFE1A97A), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterE1A97A.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFFDFB38B), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterDFB38B.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFFCC9853), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterCC9853.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFFCB814F), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterCB814F.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFFCB814F), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterCB814F.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFFAC8054), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filterAC8054.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFF9F5B34), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filter9F5B34.deepar',),
                      FilterShadeCard(foundationColor: Color(0xFF885A44), productName: 'Product Name', shadeName: 'ShadeName', filterPath: 'assets/effects/filter885A44.deepar',),
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

class FilterShadeCard extends StatelessWidget {
  const FilterShadeCard({
    super.key,
    required this.foundationColor,
    required this.productName,
    required this.shadeName,
    required this.filterPath,
  });
  final Color foundationColor;
  final String productName;
  final String shadeName;
  final String filterPath;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ArPreview(filePath: filterPath)));
    },
        child: Container(
          decoration: BoxDecoration(
            color: kBackgroundGrey,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset.fromDirection(2),
                blurRadius:1,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          height: 75,
          child: Row(
            children: [
              SizedBox(width: 10,),
              Container(
                height:50,
                width: 50,
                decoration: BoxDecoration(
                  color: foundationColor,
                  borderRadius: BorderRadius.all(Radius.circular(50),),
                  border: Border.all(
                    color: kBabyPink,
                    width: 3,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName, style: TextStyle(color: kBlack, fontSize: 14, fontFamily: 'Poppins'),),
                    Text(shadeName, style: TextStyle(color: kBarbiePink, fontSize: 14, fontFamily: 'Poppins'),),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
