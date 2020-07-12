import 'package:ailonmuskfrontend/TweetList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Bio.dart';

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
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextField(
                controller: prefixController,
              ),
              SizedBox(
                height: 32,
              ),
              Bio(),
              myData.isEmpty
                  ? Container()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: myData.length,
                          itemBuilder: (ctx, index) {
                            return TweetList(text: myData[index]);
                          }),
                    )
              //Text(myData[0]),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: makeRequest,
          child: Icon(Icons.add),
        ));
  }
}
