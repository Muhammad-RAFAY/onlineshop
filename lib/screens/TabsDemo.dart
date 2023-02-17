import 'package:flutter/material.dart';

import '../widgets/myproductsgrid.dart';

class TabDemo extends StatefulWidget {
  const TabDemo({Key? key}) : super(key: key);

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ChatApp"),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(fontSize: 20),
            onTap: (index) {
              print(index);
            },
            tabs: [
              Tab(icon: Icon(Icons.chat), text: "Products"),
              Tab(
                text: "Gallery",
                icon: Icon(Icons.browse_gallery),
              ),
              Tab(
                icon: Icon(Icons.call),
                text: "Calls",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    onTap: (index1) {},
                    tabs: [
                      Tab(
                        child: Text(
                          "Categories",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "All Products",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(color: Colors.red, fontSize: 50),
                        ),
                        MyProductGrid()
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gallery(),
            Calls(),
          ],
        ),
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (ctx, index) {
          return Container(
            padding: EdgeInsets.all(2),
            child: Image(
              image: AssetImage(""),
            ),
          );
        });
  }
}

class Calls extends StatelessWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Image(
                image: AssetImage(""),
              ),
            ),
            title: Text("Rafay"),
            subtitle: Text("hello"),
            trailing: Icon(Icons.call),
          );
        });
  }
}

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Image(
                image: AssetImage(""),
              ),
            ),
            title: Text("Flutter"),
            subtitle: Text("Nothing"),
            trailing: Text("time"),
          );
        });
  }
}
