import 'package:flutter/material.dart';
import 'package:h14barad/screens/TabOne/Components/nft_card.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({super.key});
  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab> {
  @override
  Widget build(BuildContext context) {
    return NFTCard(imagePath: "assets/TabOneImages/card_img2.jpeg",);
  }
}
