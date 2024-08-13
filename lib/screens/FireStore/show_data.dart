import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  ShowData(this.operation, {Key? key}) : super(key: key);
  String operation = '';
  @override
  State<ShowData> createState() => _ShowDataState();
}

final readFireStoreDatabase = FirebaseFirestore.instance.collection("Data").snapshots();
class _ShowDataState extends State<ShowData> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.operation == "add"
            ? const Text(
                "Added Data",
                style: TextStyle(fontStyle: FontStyle.italic),
              )
            : widget.operation == "delete"
                ? const Text(
                    "Delete",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                : const Text(
                    "Update",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: readFireStoreDatabase,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              log("Error: ${snapshot.error}");
              return const Text(".......having some error!!!");
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  log("Cheque----------->${snapshot.data!.docs[index]['firstname']}");
                  var D = snapshot.data!.docs[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(D["img"]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${D["firstname"]} ${D["lastname"]}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                D["email"],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    deleteUserData(D["id"]);
                                  },
                                  child: widget.operation == "delete"
                                      ? const Icon(Icons.delete)
                                      : Container()),
                              InkWell(
                                  onTap: () {
                                    _lastController.text = "";
                                    _firstController.text = "";
                                    _emailController.text = "";
                                    getUserData(D["id"]);
                                  },
                                  child: widget.operation == "edit"
                                      ? const Icon(Icons.edit)
                                      : Container()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }

  deleteUserData(id) {
    //_dbref.child("user_data").remove().;
    FirebaseFirestore.instance.collection("Data").doc(id).delete();
  }

  void updateUserData(id) {
    FirebaseFirestore.instance.collection("Data").doc(id).update({
      "email": _emailController.text,
      "firstname": _firstController.text,
      "lastname": _lastController.text
    });
  }

  Future<void> getUserData(String id) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Userdata'),
          content: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _firstController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _lastController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text(
                  'ok',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  updateUserData(id);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
