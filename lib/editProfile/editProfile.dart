import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    // numberController.text = "02323224";
    // nameController.text = "Ahmed";
    // emailController.text = "ahmed@gmail.com";
    // passController.text = "123456";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  numberController.text = "02323224";
                  nameController.text = "Ahmed";
                  emailController.text = "ahmed@gmail.com";
                  passController.text = "123456";
                  if (isReadOnly == true) {
                    isReadOnly = false;
                  } else {
                    isReadOnly = true;
                  }
                });
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              readOnly: isReadOnly,
              controller: numberController,
              decoration: InputDecoration(label: Text("Number")),
            ),
            TextField(
              readOnly: isReadOnly,
              controller: nameController,
              decoration: InputDecoration(label: Text("Name")),
            ),
            TextField(
              readOnly: isReadOnly,
              controller: emailController,
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              readOnly: isReadOnly,
              controller: passController,
              decoration: InputDecoration(label: Text("Password")),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    numberController.text = numberController.text;
                    nameController.text = nameController.text;
                    emailController.text = emailController.text;
                    passController.text = passController.text;
                    isReadOnly = true;
                  });
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
