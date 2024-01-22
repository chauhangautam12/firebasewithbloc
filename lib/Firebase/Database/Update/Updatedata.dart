import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Get/getdataWithjson.dart';

class Updatedata extends StatefulWidget {
  const Updatedata({super.key, required this.user});
  final String user;

  @override
  State<Updatedata> createState() => _UpdatedataState();
}

class _UpdatedataState extends State<Updatedata> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            controller: email,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "email"),
          ),
          TextFormField(
            controller: pass,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "password"),
          ),
          MaterialButton(onPressed: (){
            String Email=email.text.toString();
            String Pass=pass.text.toString();
            Map<String,dynamic>newuser={
              "name":Email,
              "Password":Pass
            };
            FirebaseFirestore.instance.collection("user").doc(widget.user).update(newuser).then((value) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => getdataWithjson(),));
              setState(() {
                email.clear();
                pass.clear();
              });
            });

          },child: Text("Submit"),)
        ],
      ),
    );
  }
}
