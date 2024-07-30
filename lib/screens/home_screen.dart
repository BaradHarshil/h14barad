import 'package:flutter/material.dart';
import 'my_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu_open_sharp),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: MyDrawer(),

    body: Container(
          color: Colors.black,
          child: Center(
            child: const Text(
              "Welcome Home",
              style: TextStyle(fontSize: 38, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
}

