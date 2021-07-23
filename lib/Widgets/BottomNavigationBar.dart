import 'package:assignment/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  // Initialize home controller
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navBarItem(Icons.account_balance_wallet_outlined, 0),
          navBarItem(Icons.message_outlined, 1),
          navBarItem(Icons.notification_important_outlined, 2),
          navBarItem(Icons.person, 3),
          navBarItem(Icons.menu, 4),
        ],
      ),
    );
  }

  Widget navBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          homeController.changeSelectedIndex(index);
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: Get.width / 5,
        child: index == 0
            ? Stack(
                children: [
                  Obx(() => Icon(
                    icon,
                    color: homeController.selectedIndex == index ? Colors.black : Colors.grey,
                    size: 32,
                  )),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            )),
                      child: Text("1",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),
                      )
                ],
              )
            : Obx(() => Icon(
          icon,
          color: homeController.selectedIndex == index ? Colors.black : Colors.grey,
          size: 32,
        )),
      ),
    );
  }
}
