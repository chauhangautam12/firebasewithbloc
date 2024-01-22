import 'package:firebaserelateed/Firebase/GoogleSignin/Getx/GetxConttroller.dart';
import 'package:firebaserelateed/Firebase/GoogleSignin/Profile%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GoogleSign extends StatefulWidget {
  const GoogleSign({super.key});

  @override
  State<GoogleSign> createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  GetxConttrollers controller=Get.put(GetxConttrollers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Sign In"),
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){
        controller.signInWithGoogle(context: context).then((value)
        => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(),)));
      },child: Text("Sign in"),),
    );
  }
}
