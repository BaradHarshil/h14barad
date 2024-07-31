import 'package:flutter/material.dart';
import 'package:h14barad/screens/TabOne/Components/nft_card.dart';

class TopTab extends StatefulWidget {
  TopTab({super.key});
  @override
  State<TopTab> createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> {
  @override
  Widget build(BuildContext context) {
    return NFTCard(imagePath: "assets/TabOneImages/card_img3.jpeg",);
  }
}
