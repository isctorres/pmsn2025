import 'package:flutter/material.dart';
import 'package:pmsn2025/views/item_student_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ALUMNOS'),
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text("Alumnos Grupo Base", style: TextStyle(fontSize: 20),),
              subtitle: Text("Enero - Junio"),
              trailing: Column(
                children: [
                  Text("2024", style: TextStyle(fontSize: 20),)
                ],
              )
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: const [
                ItemStudentView(),
                SizedBox(height: 10,),
                ItemStudentView()
              ],
            )
          ],
        )
      ),
    );
  }
}