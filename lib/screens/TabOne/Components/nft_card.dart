import 'package:flutter/material.dart';
class NFTCard extends StatefulWidget {
  String imagePath;
  NFTCard({super.key, required this.imagePath});
  @override
  State<NFTCard> createState() => _NFTCardState();
}

class _NFTCardState extends State<NFTCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(widget.imagePath.toString(),fit: BoxFit.cover,),
      ),
    );
  }
}
