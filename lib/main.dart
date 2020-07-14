import 'package:ailonmuskfrontend/TweetList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Bio.dart';
import './TweetScreen.dart';
import './about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://ailonmuskapi-6uxbltfubq-uc.a.run.app";

  final List<String> myData = [];
  int itemCount = 0;

  Future<String> makeRequest() async {
    print("Getting data from API...");
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    String data;

    var extractdata = jsonDecode(response.body);

    data = extractdata['text'];

    print(data);

    setState(() {
      myData.add(data);
      itemCount++;
    });

    print(myData);
  }

  final TextEditingController prefixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isDesktop = mediaQuery.size.width > 500 ? true : false;

    return Scaffold(
        backgroundColor: Color(0xFF15202b),
        body: LayoutBuilder(builder: (ctx, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        //height: mediaQuery.size.height * 0.52,
                        width: isDesktop ? 500 : mediaQuery.size.width * 1,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(width: 0.5, color: Colors.grey),
                                left:
                                    BorderSide(width: 0.5, color: Colors.grey),
                                right: BorderSide(
                                    width: 0.5, color: Colors.grey))),
                        child: Bio(ctx: ctx)),
                    DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          width: 0.5, color: Colors.grey),
                                      right: BorderSide(
                                          width: 0.5, color: Colors.grey))),
                              width:
                                  isDesktop ? 500 : mediaQuery.size.width * 1,
                              child: TabBar(tabs: [
                                Tab(text: "Tweets"),
                                Tab(text: "About")
                              ]),
                            ),
                            Container(
                                width:
                                    isDesktop ? 500 : mediaQuery.size.width * 1,
                                height: 500,
                                child: TabBarView(children: [
                                  TweetScreen(myData, isDesktop, mediaQuery),
                                  About(),
                                ])),
                          ],
                        )),

                    //Text(myData[0]),
                  ],
                ),
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: makeRequest,
          child: Icon(Icons.add),
        ));
  }
}
