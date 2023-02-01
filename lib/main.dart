import 'package:flutter/material.dart';
import 'package:online_shop/customer_list_widget.dart';

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
      home: MyHomePage(title: "Product"),
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
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  List<Product> productList = [
    Product(title: "Mobile", description: "", price: 1000),
    Product(title: "Laptop", description: "", price: 400),
    Product(title: "Car", description: "", price: 1000),
  ];

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
                  ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
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
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => MyCustomerWidget(),
                    ),
                  );
                },
                child: Text('Customers')),
          ),
          Container(
            height: 500,
            child: ListView.builder(
              itemBuilder: (ctn, index) => ListTile(
                onLongPress: () {
                  productNameController.text = productList[index].title;
                  productDescriptionController.text =
                      productList[index].description!;
                  productPriceController.text =
                      productList[index].price.toString();
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: productNameController,
                            decoration:
                                InputDecoration(labelText: "Product Name"),
                          ),
                          TextField(
                            controller: productDescriptionController,
                            decoration: InputDecoration(
                              labelText: "Product Description",
                            ),
                          ),
                          TextField(
                            controller: productPriceController,
                            decoration:
                                InputDecoration(labelText: "Product Price"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String title = productNameController!.text;
                              String descripton =
                                  productDescriptionController!.text;
                              double price =
                                  double.parse(productPriceController!.text);

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
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: showModelBottomSheetFloatingActionButton,
        child: Icon(Icons.add),
      ),
    );
  }
}
