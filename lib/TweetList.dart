import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

class TweetList extends StatefulWidget {
  final String text;

  TweetList({this.text});

  @override
  _TweetListState createState() => _TweetListState();
}

class _TweetListState extends State<TweetList> {
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Colors.grey, width:0.5)),
      color: Color(0xFF15202b),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('assets/elonpfp.jpg'),
            ),
            title: Row(children: [
              Text("Elon Musk", style: TextStyle(color: Colors.white)),
              Image.network(
                'assets/verified.png',
                width: 20,
                height: 20,
              )
            ]),
            subtitle: Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65, bottom: 10),
            child: Row(children: [
              Icon(
                Icons.message,
                color: Colors.grey,
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${random.nextInt(100) + 20}K',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ),
              Icon(
                Icons.share,
                color: Colors.grey,
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${random.nextInt(300) + 20}K',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ),
              Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${random.nextInt(300) + 20}K',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              )
            ]),
          )
        ],
      ),
    );
  }
}
