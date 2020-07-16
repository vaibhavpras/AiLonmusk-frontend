import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Bio.dart';
import './TweetScreen.dart';
import './about.dart';
import 'dart:html' as html;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiLonmusk',
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
  String urlRaw = "https://ailonmuskapi-6uxbltfubq-uc.a.run.app";

  final List<String> myData = [];
  int itemCount = 0;
  bool _isLoading = false;

  void makeRequest(String prefix) async {
    setState(() {
      _isLoading = true;
    });
    print("Getting data from API...");
    print("Prefix: ${prefix}");

    String urlPrefix = urlRaw + ('/?prefix=${prefix}');

    var response = await http.get(Uri.encodeFull(urlPrefix),
        headers: {"Accept": "application/json"});

    String data;

    var extractdata = json.decode(utf8.decode(response.bodyBytes));

    data = extractdata['text'];

    print(data);

    setState(() {
      data = data.replaceAll('<|startoftext|>', '');
      data = data.replaceAll('\n', '');
      data = data.replaceAll('  ', '');
      myData.add(data);
      itemCount++;
      _isLoading = false;
    });

    print(myData);
  }

  final TextEditingController prefixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isDesktop = mediaQuery.size.width > 500 ? true : false;

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xFF15202b),
          body: LayoutBuilder(builder: (ctx, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: mediaQuery.size.width * 0.6,
                        padding: EdgeInsets.only(top: 10, bottom: 25),
                        child: _isLoading
                            ? Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 15, bottom: 12),
                                child: Text(
                                    "AiLon is typing.... (he may take a while)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isDesktop
                                            ? 20
                                            : mediaQuery.size.width * 0.04)),
                              )
                            : Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 12.8, bottom: 10),
                                    child: Text("Hey AiLon, tweet something ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: isDesktop
                                                ? 20
                                                : mediaQuery.size.width *
                                                    0.04)),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(right: 10),
                                      height: isDesktop
                                          ? 65
                                          : mediaQuery.size.width * 0.25,
                                      width: 250,
                                      child: TextField(
                                        maxLength: 150,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isDesktop
                                                ? 20
                                                : mediaQuery.size.width * 0.04),
                                        controller: prefixController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.black)),
                                          contentPadding: EdgeInsets.only(
                                              top: 5, right: 10, left: 10),
                                          prefixText: 'about ',
                                          prefixStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: isDesktop
                                                  ? 20
                                                  : mediaQuery.size.width *
                                                      0.04),
                                        ),
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: isDesktop
                                        ? 40
                                        : mediaQuery.size.width * 0.1,
                                    width: isDesktop
                                        ? 90
                                        : mediaQuery.size.width * 0.2,
                                    child: RaisedButton(
                                        color: Color(0xff1b7dba),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        onPressed: () {
                                          makeRequest(prefixController.text);
                                        },
                                        child: Text("Please!",
                                            style: TextStyle(
                                                fontSize: isDesktop
                                                    ? 15
                                                    : mediaQuery.size.width *
                                                        0.03,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        disabledColor: Color(0xff1b7dba)),
                                  )
                                ],
                              ),
                      ),

                      Container(
                          width: isDesktop ? 500 : mediaQuery.size.width * 1,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 0.3, color: Color(0xff8899A6)),
                                  left: BorderSide(
                                      width: 0.3, color: Color(0xff8899A6)),
                                  right: BorderSide(
                                      width: 0.3, color: Color(0xff8899A6)))),
                          child: Bio(ctx: ctx)),
                      DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: SizedBox(
                            height: mediaQuery.size.height * 0.6,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              width: 0.3,
                                              color: Color(0xff8899A6)),
                                          right: BorderSide(
                                              width: 0.3,
                                              color: Color(0xff8899A6)))),
                                  width: isDesktop
                                      ? 500
                                      : mediaQuery.size.width * 1,
                                  child: TabBar(
                                      indicatorColor: Color(0xff1b7dba),
                                      unselectedLabelColor: Color(0xff8899A6),
                                      labelColor: Color(0xff1b7dba),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      unselectedLabelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff8899A6),
                                          fontWeight: FontWeight.bold),
                                      tabs: [
                                        Tab(
                                          text: "Tweets",
                                        ),
                                        Tab(text: "About")
                                      ]),
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 0.3, color: Color(0xff8899A6)),
                                      left: BorderSide(
                                          width: 0.3, color: Color(0xff8899A6)),
                                      right: BorderSide(
                                          width: 0.3, color: Color(0xff8899A6)),
                                      //bottom: BorderSide(width: 0.3, color: Color(0xff8899A6))
                                    ),
                                  ),
                                  width: isDesktop
                                      ? 500
                                      : mediaQuery.size.width * 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TabBarView(children: [
                                      SingleChildScrollView(
                                          child: TweetScreen(
                                              myData, isDesktop, mediaQuery)),
                                      About(),
                                    ]),
                                  ),
                                )),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: mediaQuery.size.height * 0.15,
                                          width: mediaQuery.size.width,
                                          color: Color(0xff041320),
                                          child: Center(
                                              child: Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    height: 30,
                                                    width: 30,
                                                    child: GestureDetector(
                                                      child: Image.network(
                                                          'assets/github.png'),
                                                      onTap: () {
                                                        html.window.open(
                                                            "https://github.com/vaibhavpras",
                                                            "Github");
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10),
                                                    height: 30,
                                                    width: 30,
                                                    child: GestureDetector(
                                                      child: Image.network(
                                                          'assets/linkedin.png'),
                                                      onTap: () {
                                                        html.window.open(
                                                            "https://linkedin.com/in/vaibhavpras",
                                                            "Linkedin");
                                                      },
                                                    ),
                                                  )
                                                ]),
                                            GestureDetector(
                                              onTap: () {
                                                html.window.open(
                                                    "https://vprasanna.me",
                                                    "Website");
                                              },
                                              child: Text(
                                                "vprasanna.me",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff8899A6)),
                                              ),
                                            ),
                                          ])),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          )),

                      //Text(myData[0]),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
