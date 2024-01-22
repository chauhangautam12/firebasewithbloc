import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
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
                        trailing: IconButton(onPressed: (){
                          FirebaseFirestore.instance.collection("user").doc(snapshot.data!.docs[index].id).delete();
                        }, icon: Icon(Icons.delete)),
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
