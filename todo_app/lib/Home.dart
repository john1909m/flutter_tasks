import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/TodoModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box<TodoModel>('tasks');
  final titleController=TextEditingController();
  final descController=TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context, builder: (context){
          return Padding(

            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              children: [
                Text("Title"),
                TextField(),
                Text("Description"),
                TextField(),
                ElevatedButton(onPressed: (){
                  final title = titleController.text.trim();
                  final desc = descController.text.trim();
                  box.add(TodoModel(title: title, desc: desc));
                  titleController.clear();
                  descController.clear();
                  Navigator.pop(context);
                },
                    child:Text("Add Task") )
              ],
            ),
          );
        });
      }),
      backgroundColor: Color(0xff2b2b2b),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2b2b),
        title: Text("My Tasks",style: TextStyle(color: Colors.white),),
      ),
      body: ValueListenableBuilder(valueListenable: box.listenable(),
          builder:(context,Box<TodoModel> box,child){
            final todos =  box.values.toList();
            if(todos.isEmpty){
              return Center(child: Text("Add Your First Task"));
            }
            return ListView.builder(itemCount: todos.length,
                itemBuilder: (context,index){
                  final todo=todos[index];
                  return TaskCard
                })
          })
    );
  }
}

//hive w hive flutter w hive generatorw build runner
