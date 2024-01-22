import 'package:firebase_core/firebase_core.dart';
import 'package:firebaserelateed/Bloc/Cubit/Internetconnectwithcubit.dart';
import 'package:firebaserelateed/Bloc/EmailAuthentication/HomeEmailAuththentication.dart';
import 'package:firebaserelateed/Bloc/InternetConnect/Homescreen.dart';
import 'package:firebaserelateed/Bloc/InternetConnect/InternetBloc/InternetBloc.dart';
import 'package:firebaserelateed/Firebase/Database/Get/getdata.dart';
import 'package:firebaserelateed/Firebase/Database/Post/Postdata.dart';
import 'package:firebaserelateed/Firebase/Emailwithlogin/EmailWithLogin.dart';
import 'package:firebaserelateed/Firebase/GoogleSignin/GoogleSignIn.dart';
import 'package:firebaserelateed/Firebase/GoogleSignin/Profile%20Screen.dart';
import 'dart:io' show Platform;
import 'package:firebaserelateed/Userinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/InternetConnect/State/InternetState.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  Platform.isAndroid ?
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: 'AIzaSyC_p-my-QHOVXrG_MrbLzr-zUXrXNYrYIU',
      appId: '1:1042098952263:android:93c5fa34ca325bb8d03962',
      messagingSenderId: '1042098952263',
      projectId: 'user-e5bc9')) : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => InternetCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:GoogleSign(),
      ),
    );
  }
}

