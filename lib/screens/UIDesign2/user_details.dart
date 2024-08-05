import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:h14barad/screens/UIDesign2/single_user_data.dart';

class UserDetails extends StatefulWidget {
  String? title;
  UserDetails({super.key, required  this.title});
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  List<int> id = [];
  List<String> email = [];
  List<String> firstName = [];
  List<String> lastName = [];
  List<String> img = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: ListView.builder(
        itemCount: id.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SingleUserData(id[index])));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _dialogBuilder(img[index]);
                          },
                          child: CircleAvatar(
                            radius: 57,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(img[index]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            "${firstName[index]} ${lastName[index]}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            email[index],
                            style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  getUserDetails() async {
    String url = "https://reqres.in/api/users?page=2";
    log("URL----->$url");
    final response = await http.get(Uri.parse(url));
    var userDetail = json.decode(response.body);
    var records = userDetail["data"].toString();
    log("records====>${records.toString()}");
    if (response.statusCode == 200) {
      log("----->SuccessFULLY");
      for (int i = 0; i <= records.length; i++) {
        setState(() {
          id.add(userDetail["data"][i]["id"]);
          email.add(userDetail["data"][i]["email"]);
          firstName.add(userDetail["data"][i]["first_name"]);
          lastName.add(userDetail["data"][i]["last_name"]);
          img.add(userDetail["data"][i]["avatar"]);
        });
        log("id------>${id[i].toString()}");
        log("Email--->${email[i].toString()}");
        log("First--->${firstName[i].toString()}");
        log("Last---->${lastName[i].toString()}");
        log("IMG----->${img[i].toString()}");
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> _dialogBuilder(String img) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile'),
          content: Image.network(
            img,
            height: 400,
            width: 300,
            fit: BoxFit.cover,
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
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
