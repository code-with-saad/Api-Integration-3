import 'dart:math';

import 'package:api_integration_third/services/homeupdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpdateView extends StatefulWidget {
  final name;
  final email;
  final id;
  const UpdateView(
      {super.key, required this.name, required this.email, required this.id});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  TextEditingController namecontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController id = TextEditingController();
  var error;
  var size = 2.0;
  @override
  void initState() {
    namecontrol.text = "${widget.name}";
    emailcontrol.text = "${widget.email}";
    super.initState();
    error;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
            ),
            TextField(
              controller: namecontrol,
            ),
            TextField(
              controller: emailcontrol,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              error.toString(),
              style: TextStyle(
                  color: Colors.red.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: size),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  var myresponseapi = await updatedata(widget.id,
                      {"name": namecontrol.text, "email": emailcontrol.text});
                  print(myresponseapi.statusCode);
                  if (myresponseapi.statusCode == 200) {
                    namecontrol.clear();
                    emailcontrol.clear();
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      size = 20.0;
                      error = "something went wrong";
                    });
                  }
                },
                child: Text("Update User"))
          ],
        ),
      ),
    );
  }
}
