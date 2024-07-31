import 'package:flutter/material.dart';
class BurgerTab extends StatefulWidget {
  const BurgerTab({super.key});

  @override
  State<BurgerTab> createState() => _BurgerTabState();
}

class _BurgerTabState extends State<BurgerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "BURGER TAB"
        ),
      ),
    );
  }
}
