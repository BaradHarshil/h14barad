import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget page;  // The page to navigate to
  final List<DrawerSubItem>? subItems;  // Optional sub-items

  DrawerItem({
    required this.title,
    required this.icon,
    required this.page,
    this.subItems,
  });
}

class DrawerSubItem {
  final String title;
  final Widget page;  // The page to navigate to

  DrawerSubItem({
    required this.title,
    required this.page,
  });
}
