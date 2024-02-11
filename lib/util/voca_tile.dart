import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class VocaTile extends StatelessWidget {
  final String question;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  VocaTile({
    super.key,
    required this.question,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
              label: '삭제하기',
            ),
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              label: '수정하기',
            )
          ],
        ),
        child: Container(
          width: screenSize.width,
          child: Text(question),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(
                12,
              )),
          padding: EdgeInsets.all(24),
        ),
      ),
    );
  }
}
