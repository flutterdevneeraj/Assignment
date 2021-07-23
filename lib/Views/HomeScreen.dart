import 'package:assignment/Controllers/HomeController.dart';
import 'package:assignment/Utils/MyColors.dart';
import 'package:assignment/Utils/MyString.dart';
import 'package:assignment/Widgets/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Home controller initiazation
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      right: false,
      left: false,
      child: Scaffold(
        backgroundColor: MyColors.backgound,
        bottomNavigationBar: CustomBottomNavigation(),
        body: Column(
          children: [
            topBar(),
            bodyContect(),
            bottomBottons()
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: kToolbarHeight,
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  MyString.discover,
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
          ),
          Stack(
            children: [
              InkWell(
                  onTap: () {},
                  child: FaIcon(FontAwesomeIcons.slidersH, size: 20)),
              Positioned(
                  top: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        )),
                  ))
            ],
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {}, child: FaIcon(FontAwesomeIcons.search, size: 20)),
        ],
      ),
    );
  }

  Widget bodyContect() {
    return Obx(() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOutBack,
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1.2, 0), end: Offset(0, 0))
                .animate(animation),
            child: child,
          );
        },
        child: IndexedStack(
          // This key causes the AnimatedSwitcher to interpret this as a "new"
          // child each time the count changes, so that it will begin its animation
          // when the count changes.
          key: ValueKey<int>(homeController.currentPage.value), // add this line
          index: homeController.currentPage.value,
          children: [
            cardItem("Cherry1"),
            cardItem("Cherry2"),
            cardItem("Cherry3"),
          ],
        )));
  }

  Widget cardItem(String name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: Get.height * 0.7,
      width: Get.width,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                        color: MyColors.cardHeaderBg),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: MyColors.cardHeaderPerIcon,
                          ),
                        ),
                        Text(
                          "Last Active: 25 Jun 2021",
                          style: TextStyle(color: MyColors.cardHeaderText),
                        )
                      ],
                    ),
                  )),
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: FaIcon(FontAwesomeIcons.exclamationCircle,
                                  color: MyColors.cardExclamation, size: 22),
                            ),
                            Container(
                              height: 20,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: MyColors.newBg,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text("New",
                                      style: TextStyle(
                                          color: MyColors.newText,
                                          fontSize: 13))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FaIcon(FontAwesomeIcons.ellipsisV, size: 18),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Female, She/Her",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "20 Yrs, Dehli",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: MyColors.answersBg,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "7 same answers",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: MyColors.ngBg,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "2nd",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bio",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Share you story with everyone",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Education & Work",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Share you story with everyone",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Physical Attributes",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Share you story with everyone",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Physical Attributes",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Share you story with everyone",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBottons() {
    return Obx(() => Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
             homeController.bottonSelection(1);
            },
            child:Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: homeController.closeBtSelected.value ? MyColors.closeBotton : MyColors.white,
                border: Border.all(color: MyColors.closeBotton),
              ),
              child: Icon(
                Icons.close,
                color: homeController.closeBtSelected.value ? MyColors.white : MyColors.closeBotton,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              homeController.bottonSelection(2);
            },
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: homeController.messageBtSelected.value
                        ? MyColors.messageBotton
                        : MyColors.white,
                    border: Border.all(color: MyColors.messageBotton),
                  ),
                  child: Icon(
                    Icons.message,
                    color: homeController.messageBtSelected.value
                        ? MyColors.white
                        : MyColors.messageBotton,
                    size: 20,
                  ),
                ),
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    height: 16,
                    width: 35,
                    decoration: BoxDecoration(
                        color: MyColors.msgBtnTop,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text("4 left",
                            style: TextStyle(
                                color: MyColors.messageBotton, fontSize: 10))),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              setState(() {
                homeController.bottonSelection(3);
              });
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: homeController.likeBtSelected.value ? MyColors.likeBotton : MyColors.white,
                border: Border.all(color: MyColors.likeBotton),
              ),
              child: Icon(
                Icons.favorite,
                color: homeController.likeBtSelected.value ? MyColors.white : MyColors.likeBotton,
                size: 20,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
