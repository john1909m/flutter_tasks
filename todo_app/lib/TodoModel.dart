import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  bool isDone;

  TodoModel({ required this.title,required this.desc, this.isDone = false});

}