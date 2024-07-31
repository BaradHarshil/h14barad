import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyAppBar extends StatefulWidget {
  String title;
  var onTap;
  MyAppBar({super.key, required this.title, required this.onTap});
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child:
        Text(widget.title,style: GoogleFonts.bebasNeue(fontSize:54)),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200
            ),
            child: const Icon(Icons.search,size: 36,),
          ),
        )
      ],
    ),
    );
  }
}
