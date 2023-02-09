import 'package:flutter/material.dart';

import 'models/product.dart';

class ProductsList extends StatelessWidget {
  List<Product> productsList = [
    Product(
        title: "New Shoes",
        description: "This is so nice product",
        price: 400,
        productUrl: "assets/images/shoes.PNG"),
    Product(
      title: "Shoes",
      description: "Nothing in description",
      price: 900,
      productUrl: "assets/images/shoes1.PNG",
    ),
    Product(
      title: "Another one new Shoes",
      description: "Nothing in description",
      price: 200,
      productUrl: "assets/images/img.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          children: productsList
              .map(
                (product) => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        width: 150,
                        height: 150,
                        image: AssetImage(product.productUrl),
                      ),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("${product.description}")
                    ],
                  ),
                ),
              )
              .toList(),
        ));
  }
}
