import 'package:english_words/src/words/adjectives.dart' as adjectives;
import 'package:english_words/src/words/all.dart' as all;
import 'package:english_words/src/words/nouns.dart' as nouns;
import 'package:flutter/material.dart';

class EnglishWordsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "All Worlds"),
              Tab(
                text: "Adjectives",
              ),
              Tab(
                text: "Nouns",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: all.all.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Colors.purple,
                    width: double.infinity,
                    height: 100,
                    child: Text(
                      all.all[index],
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  );
                }),
            ListView.builder(
                itemCount: adjectives.adjectives.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Colors.purple,
                    width: double.infinity,
                    height: 100,
                    child: Text(
                      adjectives.adjectives[index],
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  );
                }),
            ListView.builder(
                itemCount: nouns.nouns.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Colors.purple,
                    width: double.infinity,
                    height: 100,
                    child: Text(
                      nouns.nouns[index],
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
