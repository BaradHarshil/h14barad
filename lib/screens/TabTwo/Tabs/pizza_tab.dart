import 'package:flutter/material.dart';

class PizzaTab extends StatefulWidget {
  const PizzaTab({super.key});

  @override
  State<PizzaTab> createState() => _PizzaTabState();
}

class _PizzaTabState extends State<PizzaTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
            "PIZZA TAB"
        ),
    );
  }
}
