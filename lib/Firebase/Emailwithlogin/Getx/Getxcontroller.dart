import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class getx extends GetxController{

   TextEditingController Email=TextEditingController();
  TextEditingController Pass=TextEditingController();

 final FirebaseAuth auth= FirebaseAuth.instance;

Future<String> firebase() async{
  try{
    await auth.createUserWithEmailAndPassword(email: Email.text, password: Pass.text);
    return "Account Create";
  }on FirebaseAuthException catch(e){
  if(e.code=="weak password"){
    return "Weak Password";
  }
  else if(e.code=="email-already-in-use"){
    return "email-already-in-use";
  }
  return "";
  }catch(e){
    print(e);
    return "";
  }
 }

 Future<String>signin() async{
   try{
     await auth.signInWithEmailAndPassword(email: Email.text, password: Pass.text).then((value) {

     });
     return "Signin";
   }on FirebaseAuthException catch(e){
     if(e.code=="weak password"){
       return "Weak Password";
     }
     else if(e.code=="email-already-in-use"){
       return "email-already-in-use";
     }
     return "";
   }catch(e){
     print(e);
     return "";
   }
 }
   // Future<String>Datafeachinfirestorage()async{
   //
   //
   // }
}