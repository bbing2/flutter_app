import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller_q;
  final controller_a;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller_q,
    required this.controller_a,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: Container(
        color: Colors.green,
        height: 180,
        child: Column(
          children: [
            TextField(
              controller: controller_q,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "문제 입력",
              ),

            ),
            TextField(
              controller: controller_a,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "정답 입력"),
            ),
            //save + cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(
                  text: "저장",
                  onPressed: onSave,
                ),
                SizedBox(
                  width: 10,
                ),
                //cancel button
                MyButton(
                  text: "취소",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
