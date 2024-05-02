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
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index){
            homeController.updatePageIndex(index);
          },
          indicatorColor: kBarbiePink,
          selectedIndex: homeController.currentPageIndex.value,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home', selectedIcon: Icon(Icons.home_outlined),),
            NavigationDestination(
              icon: Icon(Icons.shop),
              selectedIcon: Icon(Icons.shop_outlined),
              label: 'Shop',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
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
