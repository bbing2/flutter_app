import 'package:flutter/material.dart';
import 'package:newvoca/model/voca_database.dart';

class StudyPage extends StatefulWidget {

  final question;
  final answer;

  const StudyPage({
    Key? key,
    required this.question,
    required this.answer,

  });

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {


  @override
  Widget build(BuildContext context) {



    VocaDatabase db = VocaDatabase();
    db.loadData();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height / 4;
    int currentIndex = 0;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text('학습하기'),
        actions: [
          IconButton(
            onPressed: () {}, //복수선택 팝업창 띄우기
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: _width,
              height: _height,
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Text(db.vocaList[currentIndex][0]),
            ),
            SizedBox(
              height: 50,
            ),

            Container(
              width: _width,
              height: _height,
              color: Colors.green,
              padding: EdgeInsets.all(8.0),
              child: Text(db.vocaList[currentIndex][1]),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('이전 문제가 없습니다.'),
                        ),
                      );
                    } else {
                      setState(() {
                        currentIndex -= 1;
                      });

                    }
                  },
                  child: Text('이전문제'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex == db.vocaList.length-1 ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('마지막 문제입니다.'),
                        ),
                      );
                    } else {
                      setState(() {
                        currentIndex += 1;
                      });
                    }
                  },
                  child: Text('다음문제'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

