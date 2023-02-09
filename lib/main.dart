import 'package:flutter/material.dart';
import 'package:online_shop/customer_list_widget.dart';

import 'ProductList.dart';
import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Online Shop",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Shop App";

  int index = 0;

  List<Widget> listOfWidgets = [
    Text("Home", style: TextStyle(fontSize: 30)),
    MyProducts(),
    ContactUs()
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

class MyProducts extends StatefulWidget {
  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController productDescriptionController = TextEditingController();

  TextEditingController productPriceController = TextEditingController();

  void showModelBottomSheetFloatingActionButton() {
    productNameController.clear();
    productDescriptionController.clear();
    productPriceController.clear();

    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        child: Column(
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextField(
              controller: productDescriptionController,
              decoration: InputDecoration(
                labelText: "Product Description",
              ),
            ),
            TextField(
              controller: productPriceController,
              decoration: InputDecoration(labelText: "Product Price"),
            ),
            ElevatedButton(
              onPressed: () {
                String title = productNameController.text;
                String descripton = productDescriptionController.text;
                double price = double.parse(productPriceController.text);

                setState(() {
                  productList.add(Product(
                      title: title,
                      price: price,
                      description: descripton,
                      productUrl: ""));
                });
                productNameController.clear();
                productPriceController.clear();
                productDescriptionController.clear();

                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  List<Product> productList = [
    Product(title: "Mobile", description: "", price: 1000, productUrl: ""),
    Product(title: "Laptop", description: "", price: 400, productUrl: ""),
    Product(title: "Car", description: "", price: 1000, productUrl: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctn, index) => ListTile(
        onLongPress: () {
          productNameController.text = productList[index].title;
          productDescriptionController.text = productList[index].description!;
          productPriceController.text = productList[index].price.toString();
          showModalBottomSheet(
            context: context,
            builder: (ctx) => Container(
              child: Column(
                children: [
                  TextField(
                    controller: productNameController,
                    decoration: InputDecoration(labelText: "Product Name"),
                  ),
                  TextField(
                    controller: productDescriptionController,
                    decoration: InputDecoration(
                      labelText: "Product Description",
                    ),
                  ),
                  TextField(
                    controller: productPriceController,
                    decoration: InputDecoration(labelText: "Product Price"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String title = productNameController!.text;
                      String descripton = productDescriptionController!.text;
                      double price = double.parse(productPriceController!.text);

                      setState(() {
                        productList[index].title = title;
                        productList[index].description = descripton;
                        productList[index].price = price;
                      });

                      Navigator.of(context).pop();
                    },
                    child: Text("Submit"),
                  )
                ],
              ),
            ),
          );
        },
        leading: Text("\$${productList[index].price}"),
        title: Text(productList[index].title),
        subtitle: Text("${productList[index].description}"),
        trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {
              setState(() {
                productList.removeAt(index);
              });
            }),
      ),
      itemCount: productList.length,
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Contact Us: "),
          Text("Phone Number: "),
          Text("Email Address: "),
        ],
      ),
    );
  }
}
