import 'package:flutter/material.dart';
class MyTabBar extends StatefulWidget {
  List tabOptions;
  MyTabBar({super.key, required this.tabOptions});
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.black,
          unselectedLabelStyle: const TextStyle(color: Colors.grey,),
          labelColor: Colors.black,
          tabs: [
            Text(widget.tabOptions[0][0]),
            Text(widget.tabOptions[1][0]),
            Text(widget.tabOptions[2][0]),
          ],
        ),

        Expanded(child: TabBarView(
          children: [
            widget.tabOptions[0][1],
            widget.tabOptions[1][1],
            widget.tabOptions[2][1],
          ],
        ),),
      ],
    );
  }
}
