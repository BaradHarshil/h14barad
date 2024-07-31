import 'package:flutter/material.dart';
import 'package:h14barad/screens/TabOne/Components/nft_card.dart';


class RecentTab extends StatefulWidget {
  RecentTab({super.key});
  @override
  State<RecentTab> createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  @override
  Widget build(BuildContext context) {
    return  NFTCard(imagePath: "assets/TabOneImages/card_img1.jpeg",);
  }
}
