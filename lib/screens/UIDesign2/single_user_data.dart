import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SingleUserData extends StatefulWidget {
  int userId;
  SingleUserData(this.userId, {super.key});
  @override
  State<SingleUserData> createState() => _SingleUserDataState();
}

class _SingleUserDataState extends State<SingleUserData> {
  @override
  void initState() {
    super.initState();
    getUserById();
  }

  late int id;
  String firstName = "", lastName = "", email = "", img = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Single User")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            CircleAvatar(
              radius: 57,
              backgroundColor: Colors.black26,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(img),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "$firstName $lastName",
                style: const TextStyle(fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(email, style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),),
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.grey,thickness: 1,),
          ],
        ),
      ),
    );
  }

  getUserById() async {
    String url = "https://reqres.in/api/users/${widget.userId.toString()}";
    log("url-USER----->$url");
    final response = await http.get(Uri.parse(url));
    var userData = json.decode(response.body);
    var records = userData["data"].toString();
    log("records====>${records.toString()}");
    if (response.statusCode == 200) {
      log("------>SuccessFULLY");
      setState(() {
        id = userData["data"]["id"];
        email = userData["data"]["email"];
        firstName = userData["data"]["first_name"];
        lastName = userData["data"]["last_name"];
        img = userData["data"]["avatar"];
      });
      log("id--->${id.toString()}");
      log("Email--->${email.toString()}");
      log("First--->${firstName.toString()}");
      log("Last--->${lastName.toString()}");
      log("IMG--->${img.toString()}");
    } else {
      throw Exception('Failed to load album');
    }
  }
}