import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_shop/customer_list_widget.dart';
import 'package:online_shop/posts.dart';
import 'package:online_shop/screens/ProductScreen.dart';

import 'ProductList.dart';

void main() {
  // runApp(MyApp());
  String personData =
      '[[{"name":"ali","age":24,"hobbies":[]},{"name":"Noshad","age":21,"hobbies":["Writing"]}]]';
  List myJsonData = jsonDecode(personData);
  print(myJsonData[0][1]["name"]);
  print(myJsonData[0][1]["age"]);
  print(myJsonData[0][1]["hobbies"]);
}

Future<Widget> getData() {
  return Future.delayed(
    Duration(seconds: 5),
    () => Text("getData called"),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostsWidgets());
  }
}

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  String title = "Shop App";

  int index = 0;

  List<Widget> listOfWidgets = [
    Text("Home", style: TextStyle(fontSize: 30)),
    MyProducts(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 24,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.red,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 30,
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: "Contact",
          )
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                    Text(
                      "Name: Bilawal",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: Text("Products"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => MyHomePage(title: "Products")));
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("Customers"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MyCustomerWidget(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.production_quantity_limits_sharp),
                title: Text("All Products"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsList(),
                      ));
                },
              ),
              ListTile(
                title: Text("Signout"),
              ),
            ],
          )),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => MyCustomerWidget(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: listOfWidgets[index]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
