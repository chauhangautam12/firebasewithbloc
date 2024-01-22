import 'package:firebaserelateed/Firebase/Api/Api.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Column(
        children: [
          Image.network("${firebaseApi.user}"),
          Text("${firebaseApi.name}")
        ],
      ),
    );
  }
}
