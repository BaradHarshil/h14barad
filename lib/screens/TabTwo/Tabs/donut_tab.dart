import 'package:flutter/material.dart';
import 'donut_tile.dart';
class DonutTab extends StatefulWidget {
  const DonutTab({super.key});
  @override
  State<DonutTab> createState() => _DonutTabState();
}

class _DonutTabState extends State<DonutTab> {
  List donutsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["Ice Cream", "36", Colors.blue, "assets/TabTwoImages/donut (1).png"],
    ["Choco", "45", Colors.red, "assets/TabTwoImages/donut (2).png"],
    ["Strawberry", "84", Colors.pink, "assets/TabTwoImages/donut (3).png"],
    ["Apple", "98", Colors.green, "assets/TabTwoImages/donut (4).png"],
    ["Banana", "55", Colors.yellow, "assets/TabTwoImages/donut (5).png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.5),
        itemBuilder: (context, index){
      return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3]);
    }
    );
  }
}
