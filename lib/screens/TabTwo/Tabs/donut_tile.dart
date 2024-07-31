import 'package:flutter/material.dart';
class DonutTile extends StatefulWidget {
  final String donutFlavor;
  final String donutPrice;
  final donutColor;
  final String imageName;

  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, required this.donutColor, required this.imageName});
  @override
  State<DonutTile> createState() => _DonutTileState();
}

class _DonutTileState extends State<DonutTile> {
  final double borderRad= 12.0;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(12),
    child: Container(
      decoration: BoxDecoration(
        color: widget.donutColor[50],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: widget.donutColor[100],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(borderRad),topRight: Radius.circular(borderRad))
              ),
              child: Text(
                "\$${widget.donutPrice}",style: TextStyle(fontSize: 18,color: widget.donutColor[800], fontWeight: FontWeight.bold),
              ),
            )
          ],),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
            child: Image.asset("${widget.imageName}"),
          ),
          
          Text(widget.donutFlavor, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          
          Text("dunkins",style: TextStyle(color: Colors.grey[600]),),

          Padding(padding: EdgeInsets.all(5),
            child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite,color: Colors.pink[400],),
              Icon(Icons.add,color: Colors.grey[800],)
            ],
          ),)
        ],
      ),
    ),);
  }
}
