import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          contador++;
          print(contador);
          setState(() {});
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffb74093),
            title: const Text('Hola Mundo :)', 
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'SWar',
                color: Colors.white,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Image.network('https://celaya.tecnm.mx/wp-content/uploads/2021/02/cropped-FAV.png'),
            //Icon(Icons.ads_click),
            onPressed: (){
              contador++;
              print(contador);
              setState(() {});
            }
          ),
          body: Center(
            child: Text('Valor del contador $contador', 
              style: TextStyle(fontSize: 20),)
          )
        ),
      ),
    );
  }
}
