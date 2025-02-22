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
      body: FutureBuilder(
        future: database!.SELECT(), 
        builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if( snapshot.hasError ){
            return const Center(child: Text('Algo ocurrio durante la ejecución'),);
          }else{
            if( snapshot.hasData ){
              return ListView.builder(
                itemBuilder: (context, index) {
                  
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
}