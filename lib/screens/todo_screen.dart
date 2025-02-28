import 'package:flutter/material.dart';
import 'package:pmsn2025/database/task_databa.dart';
import 'package:pmsn2025/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;

  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO LIST'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: ()=>_dialogBuilder(context)
      ),
      body: FutureBuilder(
        future: database!.SELECT(), 
        builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if( snapshot.hasError ){
            return Center(child: Text('Algo ocurrio durante la ejecución'),);
            //Text(snapshot.error.toString()); 
          }else{
            if( snapshot.hasData ){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var obj = snapshot.data![index];
                  return Container(
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(obj.titleTodo!),
                          subtitle: Text(obj.dateTodo!),
                          trailing: Builder(builder:(context) {
                            if( obj.sttTodo! ){
                              return Icon(Icons.check);
                            }else{
                              return Icon(Icons.close);
                            }
                          },),
                        ),
                        Text(obj.dscTodo!)
                      ],
                    ),
                  );
                },
              );
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          }
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
        );
      },
    );
  }

}