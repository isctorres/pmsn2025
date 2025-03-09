import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn2025/database/task_databa.dart';
import 'package:pmsn2025/models/todo_model.dart';
import 'package:pmsn2025/utils/global_values.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;
  TextEditingController conTitle =  TextEditingController();
  TextEditingController conDesc =  TextEditingController();
  TextEditingController conDate =  TextEditingController();
  TextEditingController conStts =  TextEditingController();
  

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
      body: ValueListenableBuilder(
        valueListenable: GlobalValues.updList,
        builder: (context,value,widget) {
          return FutureBuilder(
            future: database!.SELECT(), 
            builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
              if( snapshot.hasError ){
                return //Center(child: Text('Algo ocurrio durante la ejecución'),);
                Text(snapshot.error.toString()); 
              }else{
                if( snapshot.hasData ){
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    padding: EdgeInsets.all(10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var obj = snapshot.data![index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey
                        ),
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
                            Text(obj.dscTodo!),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [ 
                                IconButton(onPressed: (){
                                  conTitle.text = obj.titleTodo!;
                                  conDesc.text = obj.dscTodo!;
                                  conDate.text = obj.dateTodo!;
                                  conStts.text = obj.sttTodo!.toString();

                                  _dialogBuilder(context,obj.idTodo!);
                                }, icon: Icon(Icons.edit, size: 35,)),
                                IconButton(onPressed: (){ 
                                  database!.DELETE('todo', obj.idTodo!).then((value) {
                                    if( value > 0 ){
                                      GlobalValues.updList.value = !GlobalValues.updList.value;
                                    }
                                  },);
                                }, icon: Icon(Icons.delete, size: 35,))
                              ],
                            )
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
          );
        }
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, [int idTodo = 0]){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: idTodo == 0 ? Text('Add Task') : Text('Edit Task'),
          content: Container(
            height: 280,
            width: 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: conTitle,
                  decoration: InputDecoration(hintText: 'Titulo de la tarea'),
                ),
                TextFormField(
                  controller: conDesc,
                  maxLines: 3,
                  decoration: InputDecoration(hintText: 'Descripción de la tarea'),
                ),
                TextFormField(
                  readOnly: true,
                  controller: conDate,
                  decoration: InputDecoration(hintText: 'Fecha de la tarea'),
                  onTap: () async {
                    DateTime? dateTodo = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2100)
                    );

                    if( dateTodo != null ){
                      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTodo); // format date in required form here we use yyyy-MM-dd that means time is removed
                      setState(() {
                          conDate.text = formattedDate; //set foratted date to TextField value. 
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: conStts,
                  decoration: InputDecoration(hintText: 'Estatus de la tarea'),
                ),
                Divider(),
                ElevatedButton(
                  onPressed: (){
                    if( idTodo == 0 ){
                      database!.INSERTAR('todo', {
                        'titleTodo' : conTitle.text,
                        'dscTodo' : conDesc.text,
                        'dateTodo' : conDate.text,
                        'sttTodo' : false
                      }).then((value) {
                        if( value > 0 ){
                          GlobalValues.updList.value = !GlobalValues.updList.value;
                          ArtSweetAlert.show(
                            context: context, 
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: 'Mensaje de la App',
                              text: 'Datos insertados correctamente'
                            )
                          );
                        }
                      },);
                    }else{
                      database!.UPDATE('todo', {
                        'idTodo' : idTodo,
                        'titleTodo' : conTitle.text,
                        'dscTodo' : conDesc.text,
                        'dateTodo' : conDate.text,
                        'sttTodo' : false
                      }).then((value) {
                        if( value > 0 ){
                          GlobalValues.updList.value = !GlobalValues.updList.value;
                          ArtSweetAlert.show(
                            context: context, 
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: 'Mensaje de la App',
                              text: 'Datos actualizados correctamente'
                            )
                          );
                        }
                      },);
                    }

                    conTitle.text = '';
                    conDesc.text = '';
                    conDate.text = '';
                    conStts.text = '';
                    Navigator.pop(context);
                  }, 
                  child: Text('Guardar')
                )
              ],
            ),
          ),
        );
      },
    );
  }

}