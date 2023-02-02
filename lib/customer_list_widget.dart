import 'package:flutter/material.dart';
import 'models/customer.dart';

class MyCustomerWidget extends StatefulWidget {
  const MyCustomerWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomerWidget> createState() => _MyCustomerWidgetState();
}

class _MyCustomerWidgetState extends State<MyCustomerWidget> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerContactController = TextEditingController();

  List<Customer> customerList = [
    Customer(name: "ALI", address: "Jamshoro", contactNumber: 0333),
    Customer(name: "Hassan", address: "Hyderabad", contactNumber: 09900)
  ];

  void showModelBottomSheetFloatingActionButton() {
    customerNameController.clear();
    customerAddressController.clear();
    customerContactController.clear();

    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        child: Column(
          children: [
            TextField(
              controller: customerNameController,
              decoration: InputDecoration(labelText: "Customer Name"),
            ),
            TextField(
              controller: customerAddressController,
              decoration: InputDecoration(
                labelText: "Customer Address",
              ),
            ),
            TextField(
              controller: customerContactController,
              decoration: InputDecoration(labelText: "Customer Contact Number"),
            ),
            ElevatedButton(
              onPressed: () {
                String name = customerNameController.text;
                String address = customerAddressController.text;
                int contact = int.parse(customerContactController.text);

                setState(() {
                  customerList.add(Customer(
                    name: name,
                    address: address,
                    contactNumber: contact,
                  ));
                });
                customerNameController.clear();
                customerAddressController.clear();
                customerContactController.clear();

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
        title: Text("Customers"),
      ),
      body: Column(
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Products'),
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              itemBuilder: (ctn, index) => ListTile(
                onLongPress: () {
                  customerNameController.text = customerList[index].name;
                  customerAddressController.text = customerList[index].address;
                  customerContactController.text =
                      customerList[index].contactNumber.toString();
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: customerNameController,
                            decoration:
                                InputDecoration(labelText: "Customer Name"),
                          ),
                          TextField(
                            controller: customerAddressController,
                            decoration: InputDecoration(
                              labelText: "Customer Address",
                            ),
                          ),
                          TextField(
                            controller: customerContactController,
                            decoration: InputDecoration(
                                labelText: "Customer Contact Number"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              String name = customerNameController.text;
                              String address = customerAddressController.text;
                              int contactNumber =
                                  int.parse(customerContactController.text);

                              setState(() {
                                customerList[index].name = name;
                                customerList[index].address = address;
                                customerList[index].contactNumber =
                                    contactNumber;
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
                title: Text(customerList[index].name),
                subtitle: Column(
                  children: [
                    Text("${customerList[index].address}"),
                    Text("${customerList[index].contactNumber}"),
                  ],
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        customerList.removeAt(index);
                      });
                    }),
              ),
              itemCount: customerList.length,
            ),
          ),
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
