import 'package:flutter/material.dart';

class MyProductGrid extends StatelessWidget {
  const MyProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (ctx, index) {
          return Text("Products");
        });
  }
}
