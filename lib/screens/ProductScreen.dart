import 'package:flutter/material.dart';

import '../models/product.dart';

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
                final snackBar = SnackBar(
                    action: SnackBarAction(label: "Undo", onPressed: () {}),
                    content:
                        Text("${productList[index].title} has been deleted"));
                productList.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            }),
      ),
      itemCount: productList.length,
    );
  }
}
