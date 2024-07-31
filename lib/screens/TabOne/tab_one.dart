import 'dart:developer';

import 'package:flutter/material.dart';
import 'Components/my_tabbar.dart';
import "Tabs/recent_tab.dart";
import 'Tabs/trending_tab.dart';
import 'Tabs/top_tab.dart';
import 'Components/my_appbar.dart';
import 'Components/bottom_bar.dart';
import 'Components/glass_box.dart';

class TabOne extends StatefulWidget {
  TabOne({super.key});
  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  void _searchButtonTapped(){
    log("Text Search OnTap Is success...");
  }
  List tabOption = [
    ["Recent", RecentTab()],
    ["Trending", const TrendingTab()],
    ["Top", TopTab()]
  ];
   int currentTabIndex = 0;
   void _handleBottomIndexChange(int? index){
     currentTabIndex = index!;
     setState(() {
     });
   }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        extendBody: true,
      backgroundColor: Colors.grey[350],
      bottomNavigationBar:
          GlassBox(child:
      BottomBar(
        index: currentTabIndex,
        onTap: _handleBottomIndexChange,
      ),),
      body: ListView(
        children: [
          //appbar + searchbar
          MyAppBar(
            title: "Explore Collection",
             onTap: _searchButtonTapped,
          ),

          SizedBox(
            height: 600,
              child: MyTabBar(tabOptions: tabOption),
          )
        ],
      ),
      ),
    );
  }
}
