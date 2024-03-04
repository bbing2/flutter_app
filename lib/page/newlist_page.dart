import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newvoca/page/study_page.dart';
import '../model/voca_database.dart';
import '../util/dialog_box.dart';
import '../util/voca_tile.dart';



class NewListPage extends StatefulWidget {
  const NewListPage({super.key});

  @override
  State<NewListPage> createState() => _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  final _mybox = Hive.box('voca');
  VocaDatabase db = VocaDatabase();

  @override
  void initState() {
    // TODO: implement initState

    if (_mybox.get('VOCALIST') == null) {
      //처음 실행시
      db.createInitialData();
    } else {
      //기존 데이터가 있을시
      db.loadData();
    }

    super.initState();
  }

  final controller_q = TextEditingController();
  final controller_a = TextEditingController();

  void saveNewList() {
    setState(() {
      db.vocaList.add([controller_q.text, controller_a.text]);
      controller_q.clear();
      controller_a.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewList() {
    setState(() {
      controller_q.clear();
      controller_a.clear();
    });
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller_a: controller_a,
          controller_q: controller_q,
          onSave: saveNewList,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteList(int index) {
    setState(() {
      db.vocaList.removeAt(index);
    });
    db.updateData();
  }


  void editList(int index, String newQuestion, String newAnswer) {
    setState(() {
      db.vocaList[index][0] = newQuestion;
      db.vocaList[index][1] = newAnswer;
    });
    db.updateData();
  }

  void openEditDialog(int index) {
    controller_q.text = db.vocaList[index][0];
    controller_a.text = db.vocaList[index][1];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller_a: controller_a,
          controller_q: controller_q,
          onSave: () {
            editList(index, controller_q.text, controller_a.text);
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text(
          '학습목록',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
        actions: [
          ElevatedButton(
            onPressed: () {
              if (db.vocaList.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('단어를 생성하세요'),
                  ),
                );
              } else
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return StudyPage(
                    question: controller_q,
                    answer: controller_a,
                  );
                }));
            },
            child: Text('학습시작'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: db.vocaList.length,
        itemBuilder: (context, index) {
          return VocaTile(
            question: db.vocaList[index][0],
            deleteFunction: (context) => deleteList(index),
            editFunction:  (context) => openEditDialog(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewList,
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
