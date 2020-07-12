import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          //height: 500,
          width: 500,
          color: Color(0xFF15202b),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(child: Image.network('assets/cover.jpg')),
            //Text("Elon Musk", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Container(
              child: Container(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Elon Musk",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      child: Image.network(
                        'assets/verified.png',
                        height: 10,
                        width: 10,
                      ))
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "@elonmusk",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10, right:3, top:8),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                    size: 12
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text("Joined June 2009", style: TextStyle(color: Colors.grey, fontSize: 12)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:10, top:8, bottom: 10),
              child: Row(
                children: [
                  Text("93", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 8),
                    child: Text("Following", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                  Text("36.8M", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text("Followers", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
