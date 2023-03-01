import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/customer_list_widget.dart';
import 'package:online_shop/screens/ProductScreen.dart';

import 'ProductList.dart';

void main() {
  // http.Response response = await http.get(
  //   Uri.parse(
  //     "https://jsonplaceholder.typicode.com/posts",
  //   ),
  // );
  // if (response.statusCode == 200) {
  //   List myJsonData = jsonDecode(response.body);
  //   for (int i = 0; i < myJsonData.length; i++) {
  //     print(
  //         "${myJsonData[i]["id"]} ${myJsonData[i]["title"]} ${myJsonData[i]["body"]}");
  //     print("***************************");
  //   }
  // }
  runApp(MyApp());
}

class MyJsonDataWidget extends StatefulWidget {
  @override
  State<MyJsonDataWidget> createState() => _MyJsonDataWidgetState();
}

class _MyJsonDataWidgetState extends State<MyJsonDataWidget> {
  List users = [];

  void getData() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: Text("${users[index]["id"]}"),
              title: Text("${users[index]["username"]}"),
              subtitle: Text("${users[index]["email"]}"),
            );
          }),
    );
  }
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
        home: MyJsonDataWidget());
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
