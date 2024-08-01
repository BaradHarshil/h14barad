import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h14barad/screens/UIDesign1/item_dashboard.dart';

class UiDesign1 extends StatefulWidget {
  const UiDesign1({super.key, required String title});

  @override
  State<UiDesign1> createState() => _UiDesign1State();
}

class _UiDesign1State extends State<UiDesign1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        leading: const Padding(
          padding:  EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/UiDesign1Images/pay_7.jpeg'),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Barad Shivani",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            "RS. 50,000",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.add_circled,
                color: Colors.green.shade600,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "RS. 2,520",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.green.shade600),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Today",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.add_circled),
                label: const Text("Deposit"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade900,
                    foregroundColor: Colors.white),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.file_upload_outlined),
                label: const Text("Withdraw"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white),
              child: GridView.count(crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ItemDashBoard(title: "Pay-2", image: "pay_2.jpeg"),
                ItemDashBoard(title: "Pay-3", image: "pay_3.jpeg"),
                ItemDashBoard(title: "Pay-5", image: "pay_5.jpeg"),
                ItemDashBoard(title: "Pay-7", image: "pay_7.jpeg"),
                ItemDashBoard(title: "Pay-8", image: "pay_8.jpeg"),
              ],),
            ),
          )
        ],
      ),
    );
  }
}
