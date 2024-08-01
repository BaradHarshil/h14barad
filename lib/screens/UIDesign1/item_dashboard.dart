import 'package:flutter/material.dart';
@immutable
class ItemDashBoard extends StatefulWidget {
  String title, image;
  ItemDashBoard({super.key, required this.title, required this.image});
  @override
  State<ItemDashBoard> createState() => _ItemDashBoardState();
}

class _ItemDashBoardState extends State<ItemDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          showDialog(context: context, builder: (context)=> AlertDialog(title: Text("You just clicked ${widget.title}"),
          content: Image.asset("assets/UiDesign1Images/${widget.image}",height: 200,),
          actions: [
            TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("ok, thanks"))
          ],));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0,5),
                color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Card(
                margin: const EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset("assets/UiDesign1Images/${widget.image}",fit:BoxFit.fill,),
                  ))),
              const SizedBox(height: 10,),
              Text(widget.title, style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
        ),
      ),
    );
  }
}
