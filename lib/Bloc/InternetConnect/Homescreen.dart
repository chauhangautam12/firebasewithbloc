import 'package:firebaserelateed/Bloc/Cubit/Internetconnectwithcubit.dart';
import 'package:firebaserelateed/Bloc/InternetConnect/InternetBloc/InternetBloc.dart';
import 'package:firebaserelateed/Bloc/InternetConnect/State/InternetState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BlocConsumer<InternetCubit,internetState>(
              builder: (context, state) {
                        if(state==internetState.Gain){
            return Text("Connected");
                        }
                        else if(state==internetState.Lost) {
            return Text("Loading");
                        }
                        else{
            return Text("Loading...");
                        }}, listener: (context, state) {
              if(state == internetState.Gain){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Internet Connected") ,
                backgroundColor: Colors.green,
                ));
              }
              else if(state == internetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Internet Lost"),
                backgroundColor: Colors.red,
                ));
              }
            },),
          ],
        ),
      ),
    );
  }
}
