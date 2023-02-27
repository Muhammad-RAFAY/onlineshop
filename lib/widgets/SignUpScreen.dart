import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String genderGroupValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Number"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  Row(
                    children: [
                      Text("Gender"),
                      Radio(
                        value: "Male",
                        groupValue: genderGroupValue,
                        onChanged: (value) {
                          setState(() {
                            genderGroupValue = value!;
                          });
                        },
                      ),
                      Radio(
                        value: "Female",
                        groupValue: genderGroupValue,
                        onChanged: (value) {
                          setState(() {
                            genderGroupValue = value!;
                          });
                        },
                      ),
                      CheckboxListTile(value: false, onChanged: (value) {}),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
