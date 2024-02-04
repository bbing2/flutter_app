import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newvoca/page/study_page.dart';

import '../model/voca_database.dart';
import 'newlist_page.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  VocaDatabase db = VocaDatabase();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Container(
              //color: Colors.red, //없애기
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '나 만 의',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[400]
                      ),
                    ),
                    Text(
                      '단 어 장',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[400]
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 300),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context){
                      return NewListPage();
                    }
                    )
                );
              },
              child: Text('생성하기',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[300],
                  foregroundColor: Colors.black,
                  minimumSize: Size(120, 40)
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text('종료하기',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[300],
                  foregroundColor: Colors.black,
                  minimumSize: Size(120, 40)
              ),
            )
          ],
        ),
      ),
    );
  }
}