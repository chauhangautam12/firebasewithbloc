import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaserelateed/Firebase/Database/Get/getdata.dart';
import 'package:firebaserelateed/Firebase/Database/Get/getdataWithjson.dart';
import 'package:flutter/material.dart';

class Postdata extends StatefulWidget {
  const Postdata({super.key});

  @override
  State<Postdata> createState() => _PostdataState();
}

class _PostdataState extends State<Postdata> {

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
            FirebaseFirestore.instance.collection("user").add(newuser).then((value){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>getdataWithjson(),));
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
