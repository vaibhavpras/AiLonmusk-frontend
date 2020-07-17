import './tweet_item.dart';
import 'package:flutter/material.dart';


class TweetScreen extends StatelessWidget {
  final List<String> myData;
  final bool isDesktop;
  final mediaQuery;

  TweetScreen(this.myData, this.isDesktop, this.mediaQuery);


  @override
  Widget build(BuildContext context) {
    return myData.isEmpty
        ? Container(
            width: isDesktop ? 500 : mediaQuery.size.width * 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("No tweets yet",
                    style: TextStyle(color: Color(0xff8899A6), fontSize: 12)),
              ),
            ),
          )
        : Container(
            width: isDesktop ? 500 : mediaQuery.size.width * 1,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                shrinkWrap: true,
                itemCount: myData.length,
                itemBuilder: (ctx, index) {
                  return TweetItem(
                    text: myData[index],
          
                  );
                }),
          );
  }
}
