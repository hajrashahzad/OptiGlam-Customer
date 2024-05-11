import 'package:flutter/material.dart';
import 'package:optiglamcustomer/src/constants/constants.dart';
import '../controllers/home_controller.dart';
import 'package:get/get.dart';
import 'dashboard.dart';
import '../../shop/screens/shop_main.dart';
import '../../profile/screens/profile.dart';
class Home extends StatelessWidget {
  Home({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset.fromDirection(4),
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
              )
            ]
          ),
          child: NavigationBar(
            onDestinationSelected: (int index){
              homeController.updatePageIndex(index);
            },
            backgroundColor: kWhite,
            indicatorColor: kWhite,
            elevation: 0,
            selectedIndex: homeController.currentPageIndex.value,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined,  color: kBlack,), label: 'Home', selectedIcon: Icon(Icons.home),),
              NavigationDestination(
                icon: Icon(Icons.shop_outlined, color: kBlack,),
                selectedIcon: Icon(Icons.shop),
                label: 'Shop',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined,  color: kBlack,),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: <Widget>[
          const Dashboard(),
          Shop(),
          const ProfilePage(),
        ][homeController.currentPageIndex.value],
      ),
    );
  }
}
