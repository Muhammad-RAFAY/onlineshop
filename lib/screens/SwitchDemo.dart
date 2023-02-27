import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isSelected = false;
  bool isSelected1 = false;
  String groupValue = "";
  String groupValueForAnotherRadio = "";
  bool isChecked = false;
  bool isChecked1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SwitchListTile(
              title: Text("Bags"),
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value;
                  if (isSelected1) {
                    isSelected1 = false;
                  }
                });
                print(value);
              }),
          SwitchListTile(
              title: Text("shoes"),
              value: isSelected1,
              onChanged: (value) {
                setState(() {
                  isSelected1 = value;
                  if (isSelected) {
                    isSelected = false;
                  }
                });
                print(value);
              }),
          RadioListTile(
              activeColor: Colors.red,
              title: Text("Markers"),
              value: "Markersssssss",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
                print(value!);
              }),
          RadioListTile(
              title: Text("Bags"),
              value: "Bags",
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
                print(value!);
              }),
          CheckboxListTile(
              title: Text("Email Services"),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
                print(value);
              }),
          CheckboxListTile(
              title: Text("Email Services"),
              value: isChecked1,
              onChanged: (value) {
                setState(() {
                  isChecked1 = value!;
                });
                print(value);
              })
        ],
      ),
    );
  }
}
