import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget{
  const TaskCard({
    super.key,
    required this.title,
    required this.desc,
    required this.isCompleted,
    required this.onChanged,
    required this.onDelete,

});
  final String title;
  final String desc;
  final bool isCompleted;
  final void Function(bool?)? onChanged;
  final void Function()? onDelete;



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(value: isCompleted,
          onChanged: ,
        ),
        title: Text(title),
        trailing: IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
      ),
    );
  }

}
