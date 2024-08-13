import 'package:flutter/material.dart';
import 'package:h14barad/models/drawer_model.dart';
import 'package:h14barad/screens/FireStore/crud_operation.dart';
import 'package:h14barad/screens/home_screen.dart';
import 'package:h14barad/screens/TabOne/tab_one.dart';
import 'package:h14barad/screens/TabTwo/tab_two.dart';
import 'package:h14barad/screens/UIDesign1/ui_design1.dart';
import '../screens/UIDesign2/user_details.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  List<DrawerItem> drawerItems = [
    DrawerItem(title: 'Tab Views', icon: Icons.tab, page: HomeScreen(),
      subItems: [
        DrawerSubItem(title: 'Tab One', page: TabOne(),),
        DrawerSubItem(title: 'Tab Two', page: const TabTwo(),),
      ]
    ),
    DrawerItem(title: 'UI Design', icon: Icons.design_services_outlined, page: HomeScreen(),
    subItems: [
      DrawerSubItem(title: 'screen1', page: const UiDesign1(title: "UiDesign1",),),
      DrawerSubItem(title: 'screen2 + API', page: UserDetails(title: "Ui + API",),),
    ]),
    DrawerItem(title: 'Firebase', icon: Icons.local_fire_department_outlined, page: HomeScreen(),
      subItems: [
        DrawerSubItem(title: 'CRUD', page: CrudOperation(),),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
            const UserAccountsDrawerHeader(
            accountName: Text("AppMaking.co",style: TextStyle(color: Colors.black),),
            accountEmail: Text("baradharshil2015@mail.com",style: TextStyle(color: Colors.black),),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: [
               CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/74.jpg"),
              ),
               CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/47.jpg"),
              ),
            ],
          ),
          Expanded(
            child: ListView(
            padding: EdgeInsets.zero,
            children: drawerItems.map((item) {
              return ExpansionTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                children: item.subItems != null
                    ? item.subItems!.map((subItem) {
                  return ListTile(
                    title: Text(subItem.title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => subItem.page),
                      );
                    },
                  );
                }).toList()
                    : [
                  ListTile(
                    title: Text('Go to ${item.title}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => item.page),
                      );
                    },
                  ),
                ],
              );
            }).toList(),
          ),
          )
        ],
      )
    );
  }
}
