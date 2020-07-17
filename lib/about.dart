import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: Wrap(
          spacing: 15.0,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "AiLonmusk is built using OpenAI's Generative Pretrained Transformer 2 (GPT2).",
                style: TextStyle(color: Color(0xff8899A6), fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "The model is trained using data scraped from @elonmusk, @boredelonmusk twitter accounts and Elon's public interviews, speeches and podcasts.",
                style: TextStyle(color: Color(0xff8899A6), fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "The model works best when the prefix text is something closely relevant to Elon's public lifestyle and businesses or is left blank.",
                style: TextStyle(color: Color(0xff8899A6), fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "This App is for Educational/Entertainment purposes only and cannot be used to impersonate or incriminate any persons involved.",
                style: TextStyle(color: Color(0xff8899A6), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
