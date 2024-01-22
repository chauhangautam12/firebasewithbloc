import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaserelateed/Firebase/Database/Update/Updatedata.dart';
import 'package:flutter/material.dart';

class getdata extends StatefulWidget {
  const getdata({super.key});

  @override
  State<getdata> createState() => _getdataState();
}

class _getdataState extends State<getdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       backgroundColor: Colors.amber,
),
      body:
          StreamBuilder(stream: FirebaseFirestore.instance.collection("user").snapshots(), builder: (context, snapshot) {

            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map<String,dynamic>userdata=snapshot.data!.docs[index].data();
                 log("Data:-${jsonEncode(userdata)}");

                return ListTile(
                  title: Text(userdata["name"]),
                  trailing: IconButton(onPressed: (){

                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Updatedata(),));
                  }, icon: Icon(Icons.edit)),
                );
              },);
            }else{
              return Center(child: Text("Nodata"));
            }
          },)
    );
  }
}
