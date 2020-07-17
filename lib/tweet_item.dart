import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:intl/intl.dart';
import 'dart:math';

class TweetItem extends StatefulWidget {
  final String text;
  //final randR;
  //final randL;
  //final randC;

  //TweetItem({this.text, this.randC, this.randR, this.randL});
  TweetItem({
    this.text,
  });

  @override
  _TweetItemState createState() => _TweetItemState();
}

class _TweetItemState extends State<TweetItem> {
  Random random = new Random();
  bool retweetS;
  bool likeS;
  bool commentS;

  int randC;
  int randL;
  int randR;

  void initState() {
    super.initState();
    retweetS = false;
    likeS = false;
    commentS = false;
    randC = random.nextInt(100) + 20;
    randL = random.nextInt(200) + 60;
    randR = random.nextInt(300) + 60;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isDesktop = mediaQuery.size.width > 500 ? true : false;

    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xff66757f), width: 0.5))),
      width: isDesktop ? 500 : mediaQuery.size.width * 1,
      //height: 100,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: CircleAvatar(
            backgroundImage: NetworkImage('assets/AiLonpfp.jpg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AiLon Musk",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2),
                    child: Image.network(
                      'assets/verified.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    child: Text(
                      "@AiLonmusk · ",
                      style: TextStyle(fontSize: 12, color: Color(0xff66757f)),
                    ),
                  ),
                  Text(
                    DateFormat.MMMd().format(DateTime.now()),
                    style: TextStyle(fontSize: 12, color: Color(0xff66757f)),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 1.3, bottom: 0),
                width: isDesktop ? 300 : mediaQuery.size.width * 0.77,
                child: Text(
                  widget.text,
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontSize: 12, color: Colors.white, height: 1.3),
                ),
              ),
              Container(
                width: isDesktop ? 300 : mediaQuery.size.width * 0.77,
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              commentS = !commentS;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 14,
                                width: 14,
                                child: commentS == true
                                    ? Image.network('assets/commentS.png')
                                    : Image.network('assets/comment.png'),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: commentS == true
                                      ? Text('${randC}K',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff1da1f2)))
                                      : Text('${randC}K',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff8899A6)))),
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              retweetS = !retweetS;
                            });
                          },
                          child: Row(children: [
                            Container(
                              height: 14,
                              width: 14,
                              child: retweetS == true
                                  ? Image.network('assets/retweetS.png')
                                  : Image.network('assets/retweet.png'),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: retweetS == true
                                    ? Text('${randR}K',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff17bf63)))
                                    : Text('${randR}K',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff8899A6)))),
                          ])),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            likeS = !likeS;
                          });
                        },
                        child: Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 14,
                                width: 14,
                                child: likeS == true
                                    ? Image.network('assets/likeS.png')
                                    : Image.network('assets/like.png'),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: likeS == true
                                      ? Text('${randL}K',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xffe0245e)))
                                      : Text('${randL}K',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff8899A6)))),
                            ]),
                      )
                    ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
