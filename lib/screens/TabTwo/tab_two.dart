import 'package:flutter/material.dart';
import 'package:h14barad/screens/TabTwo/my_tab.dart';
import 'package:h14barad/screens/TabTwo/Tabs/burger_tab.dart';
import 'package:h14barad/screens/TabTwo/Tabs/donut_tab.dart';
import 'package:h14barad/screens/TabTwo/Tabs/pancake_tab.dart';
import 'package:h14barad/screens/TabTwo/Tabs/pizza_tab.dart';
import 'package:h14barad/screens/TabTwo/Tabs/smoothie_tab.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});
  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo> {
  List<Widget> myTabs = [
    MyTab(iconPath: "assets/TabTwoImages/donut.png"),
    MyTab(iconPath: "assets/TabTwoImages/burger.png"),
    MyTab(iconPath: "assets/TabTwoImages/pancake.png"),
    MyTab(iconPath: "assets/TabTwoImages/pizza.png"),
    MyTab(iconPath: "assets/TabTwoImages/smoothie.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[50],
          leading: Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: Column(
          children: [
            // I WANT TO EAT
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text(
                    "I want to eat ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "EAT",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            // TAB BAR
            TabBar(
                tabs: myTabs,
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                splashBorderRadius: BorderRadius.circular(10)),

            //TAB BAR VIEW
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  PancakeTab(),
                  PizzaTab(),
                  SmoothieTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
