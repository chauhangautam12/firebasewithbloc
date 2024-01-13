
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Getx/Getxcontroller.dart';

class EmailWithLogin extends StatefulWidget {
  const EmailWithLogin({super.key});

  @override
  State<EmailWithLogin> createState() => _EmailWithLoginState();
}

class _EmailWithLoginState extends State<EmailWithLogin> {
  getx controller=Get.put(getx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: "Email"),
            controller: controller.Email,
          ),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Password"),
            controller: controller.Pass,
          ),
          MaterialButton(onPressed: (){
            controller.firebase();
          },child: Text("Signout"),),
          MaterialButton(onPressed: (){
            controller.signin();
          },child: Text("Sign in"),)
        ],
      ),
    );
  }
}
