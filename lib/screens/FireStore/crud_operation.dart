import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:h14barad/screens/FireStore/show_data.dart';

class CrudOperation extends StatefulWidget {
  CrudOperation({super.key});
  @override
  State<CrudOperation> createState() => _CrudOperationState();
}

class _CrudOperationState extends State<CrudOperation> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();

  late final fireStore = FirebaseFirestore.instance.collection("Data");
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("CRUD OP with Firebase")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(color: Colors.grey,thickness: 1,),
            const SizedBox(height: 100,),
            const Text("Enter details for Add data",style: TextStyle(fontSize: 21),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.black26), //<-- SEE HERE
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _firstController,
                          decoration: const InputDecoration(labelText: "First Name",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                          controller: _lastController,
                          decoration: const InputDecoration(labelText: "Last Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
             padding: EdgeInsets.only(left: w*0.02,right: w*0.02),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green, side: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  onPressed: ()  async {
                    await createDataBase();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowData("add")));
                      },
                  child: const Text("Add"),
                 ),
                 OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.brown, side: const BorderSide(color: Colors.brown,),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowData("edit")));
                    },
                  child: const Text("Go Edit"),
                 ),

                 OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowData("delete")));
                  },
                  child: const Text("Go Delete",style:TextStyle(overflow: TextOverflow.clip),),
                 ),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }

  createDataBase(){
    // _dbref.child("Data").set({"firstname": _firstController.text, "lastname":_lastController.text,"email":_emailController.text,"img":img});
     String id = DateTime.now().millisecondsSinceEpoch.toString();
     //fireStore.add({});
     fireStore.doc(id).set(
        {
          "id": id,
          "email": _emailController.text,
          "firstname": _firstController.text,
          "lastname": _lastController.text,
          "img": "https://pbs.twimg.com/media/FJ96vOQWUAwbIah.jpg:large"
        }
    ).then((value){
      log("---------------success-----------------");
    }).onError((error, stackTrace){ log("---------------ERROR-----------------"); });
  }
}