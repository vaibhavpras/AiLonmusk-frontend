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
int rand = random.nextInt(300) + 60;
int randC = random.nextInt(100) + 20;

class _TweetItemState extends State<TweetItem> {
  Image imgRetweet;
  Image imgComment;
  Image imgLike;

  Image retweet = Image.network('assets/retweet.png');
  Image comment = Image.network('assets/comment.png');
  Image like = Image.network('assets/like.png');

  Image retweetS = Image.network('assets/retweetS.png');
  Image commentS = Image.network('assets/commentS.png');
  Image likeS = Image.network('assets/likeS.png');

  Text txtRetweet;
  Text txtComment;
  Text txtLike;

  Text retweetTx = Text('${rand}K',
      style: TextStyle(fontSize: 10, color: Color(0xff8899A6)));
  Text commentTx = Text('${randC}K',
      style: TextStyle(fontSize: 10, color: Color(0xff8899A6)));
  Text likeTx = Text('${rand}K',
      style: TextStyle(fontSize: 10, color: Color(0xff8899A6)));

  Text retweetTxS = Text('${rand}K',
      style: TextStyle(fontSize: 10, color: Color(0xff17bf63)));
  Text commentTxS = Text('${randC}K',
      style: TextStyle(fontSize: 10, color: Color(0xff1da1f2)));
  Text likeTxS = Text('${rand}K',
      style: TextStyle(fontSize: 10, color: Color(0xffe0245e)));

  void initState() {
    super.initState();
    imgRetweet = retweet;
    imgComment = comment;
    imgLike = like;
    txtRetweet = retweetTx;
    txtComment = commentTx;
    txtLike = likeTx;
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
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  imgComment = commentS;
                                  commentS = comment;
                                  comment = imgComment;
                                  txtComment = commentTxS;
                                  commentTxS = commentTx;
                                  commentTx = txtComment;
                                });
                              },
                              child: Container(
                                height: 14,
                                width: 14,
                                child: imgComment,
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: txtComment,
                          ),
                        ],
                      ),
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imgRetweet = retweetS;
                              retweetS = retweet;
                              retweet = imgRetweet;
                              txtRetweet = retweetTxS;
                              retweetTxS = retweetTx;
                              retweetTx = txtRetweet;
                            });
                          },
                          child: Container(
                            height: 14,
                            width: 14,
                            child: imgRetweet,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: txtRetweet,
                        )
                      ]),
                      Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    imgLike = likeS;
                                    likeS = like;
                                    like = imgLike;
                                    txtLike = likeTxS;
                                    likeTxS = likeTx;
                                    likeTx = txtLike;
                                  });
                                },
                                child: Container(
                                  height: 14,
                                  width: 14,
                                  child: imgLike,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: txtLike,
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
