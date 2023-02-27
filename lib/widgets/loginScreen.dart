import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Center(
            child: Text(
          "WhatsApp",
          style: TextStyle(
              fontSize: 25, color: Colors.orange, foreground: Paint()),
        )),
        leadingWidth: 200,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Password"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
