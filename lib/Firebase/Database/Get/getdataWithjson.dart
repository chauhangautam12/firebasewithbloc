import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaserelateed/Firebase/Database/Update/Updatedata.dart';
import 'package:flutter/material.dart';

class getdataWithjson extends StatefulWidget {
  const getdataWithjson({super.key});

  @override
  State<getdataWithjson> createState() => _getdataWithjsonState();
}

class _getdataWithjsonState extends State<getdataWithjson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get With json"),
      ),
      body: Column(
        children: [
          StreamBuilder(stream:FirebaseFirestore.instance.collection("user").snapshots(),
            builder:(context, snapshot) {
            if(snapshot.hasData){
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?.docs[index]["name"]),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            showDialog(context: context, builder:(context) => Updatedata(user: snapshot.data!.docs[index].id),);

                          }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                      FirebaseFirestore.instance.collection("user").doc(snapshot.data!.docs[index].id).delete();
                      }, icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
                ),
              );
            }
            else{
              return Text(" No User ");
            }
          },)
        ],
      ),
    );
  }
}
