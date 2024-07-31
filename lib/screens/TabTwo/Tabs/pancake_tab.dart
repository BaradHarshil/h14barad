import 'package:flutter/material.dart';

class PancakeTab extends StatefulWidget {
  const PancakeTab({super.key});

  @override
  State<PancakeTab> createState() => _PancakeTabState();
}

class _PancakeTabState extends State<PancakeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "PANCAKE TAB"
        ),
      ),
    );
  }
}
