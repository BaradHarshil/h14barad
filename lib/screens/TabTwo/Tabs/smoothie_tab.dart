import 'package:flutter/material.dart';
class SmoothieTab extends StatefulWidget {
  const SmoothieTab({super.key});

  @override
  State<SmoothieTab> createState() => _SmoothieTabState();
}

class _SmoothieTabState extends State<SmoothieTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "SMOOTHIE TAB"
        ),
      ),
    );
  }
}
