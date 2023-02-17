import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isSelected = false;
  String groupValue = "";
  String groupValueForAnotherRadio = "";
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
                });
                print(value);
              }),
          SwitchListTile(
              title: Text("shoes"),
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value;
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
              })
        ],
      ),
    );
  }
}
