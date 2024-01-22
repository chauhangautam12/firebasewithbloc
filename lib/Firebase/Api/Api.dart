import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class firebaseApi{
  static final FirebaseAuth auth=FirebaseAuth.instance;
  static final FirebaseFirestore storage=FirebaseFirestore.instance;
  static final user=auth.currentUser?.photoURL;
  static final name=auth.currentUser!.displayName;



}