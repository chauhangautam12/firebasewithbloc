import 'package:flutter/material.dart';

class HommeEmailAuthentication extends StatefulWidget {
  const HommeEmailAuthentication({super.key});

  @override
  State<HommeEmailAuthentication> createState() => _HommeEmailAuthenticationState();
}

class _HommeEmailAuthenticationState extends State<HommeEmailAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern",style: TextStyle(color: Colors.black,decoration: TextDecoration.underline)),
        centerTitle: true,
        toolbarHeight: 90,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
              gradient: LinearGradient(colors:[
            Colors.blueAccent,
            Colors.white,
            Colors.lime
          ])),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height:30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),suffixIcon:Icon( Icons.email)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Password",border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),suffixIcon:Icon( Icons.password)),
            ),
          ),
          MaterialButton(onPressed: (){},child: Text("Submit"),color: Colors.blueAccent,)
        ],
      ),
    );
  }
}
