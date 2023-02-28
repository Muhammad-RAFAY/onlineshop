import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostsWidgets extends StatefulWidget {
  const PostsWidgets({Key? key}) : super(key: key);

  @override
  State<PostsWidgets> createState() => _PostsWidgetsState();
}

class _PostsWidgetsState extends State<PostsWidgets> {
  @override
  void initState() {
    super.initState();
  }

  List posts = [];
  getData() async {
    Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var jsonData = jsonDecode(response.body);
    setState(() {
      posts = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text('${posts[index]['title']}'),
            );
          }),
    );
  }
}
