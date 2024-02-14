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
  late VocaDatabase db;
  late double _width;
  late double _height;
  int currentIndex = 0;
  bool isTouched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = VocaDatabase();
    db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height / 4;

    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text('학습하기'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _width,
                height: _height,
                color: Colors.green,
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      db.vocaList[currentIndex][0],
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTouched = !isTouched;
                  });
                },
                child: Container(
                  width: _width,
                  height: _height,
                  color: Colors.green,
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Text(
                        isTouched ? db.vocaList[currentIndex][1] : "?",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
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
                          isTouched = false;
                        });
                      }
                    },
                    child: Text('이전문제'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (currentIndex == db.vocaList.length - 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('마지막 문제입니다.'),
                          ),
                        );
                      } else {
                        setState(() {
                          currentIndex += 1;
                          isTouched = false;
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
      ),
    );
  }
}
