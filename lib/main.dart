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
    bool isDesktopW = MediaQuery.of(context).size.width > 500 ? true : false;
    bool isDesktopH = MediaQuery.of(context).size.width > 500 ? true : false;

    return Scaffold(
  backgroundColor: Color(0xFF15202b),
    body: LayoutBuilder(builder: (ctx, constraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                  height:MediaQuery.of(context).size.height * 0.6,
                  width: isDesktopW
                      ? 500
                      : MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: Bio(ctx: ctx)),
              myData.isEmpty
                  ? Container(
                width: isDesktopW
                    ? 500
                    : MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.grey, width: 0.5)),
                child: Center(child: Text("No tweets yet", style: TextStyle(color: Colors.grey, fontSize: 12)),),
              )
                  : Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
                    width: isDesktopW
                        ? 500
                        : MediaQuery.of(context).size.width * 1,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: myData.length,
                        itemBuilder: (ctx, index) {
                          return TweetList(text: myData[index]);
                        }),
                  )
              //Text(myData[0]),
            ],
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
