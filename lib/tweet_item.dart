import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class TweetItem extends StatefulWidget {
  final String text;

  TweetItem({this.text});

  @override
  _TweetItemState createState() => _TweetItemState();
}

Random random = new Random();

class _TweetItemState extends State<TweetItem> {
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
            backgroundImage: NetworkImage('assets/elonpfp.jpg'),
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
                    "Elon Musk",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:2),
                    child: Image.network(
                      'assets/verified.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6, right:8),
                    child: Text(
                      "@elonmusk",
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
                      Row(
                        children: [
                          Container(
                            height: 14,
                            width: 14,
                            child: Image.network(
                              'assets/comment.png',
                              scale: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text('${random.nextInt(100) + 20}K',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8899A6))),
                          ),
                        ],
                      ),
                      Row(children: [
                        Container(
                          height: 14,
                          width: 14,
                          child: Image.network(
                            'assets/retweet.png',
                            scale: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${random.nextInt(300) + 20}K',
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff8899A6))),
                        )
                      ]),
                      Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 14,
                              width: 14,
                              child: Image.network(
                                'assets/like.png',
                                scale: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('${random.nextInt(300) + 20}K',
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xff8899A6))),
                            )
                          ]),
                    ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
