import 'package:flutter/material.dart';

class TweetList extends StatefulWidget {
  final String text;

  TweetList({this.text});

  @override
  _TweetListState createState() => _TweetListState();
}

class _TweetListState extends State<TweetList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Colors.grey, width:0.5)),
      color: Color(0xFF15202b),
      width: 500,
      child: ListTile(
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
    );
  }
}
