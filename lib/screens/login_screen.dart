import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final txtUser = TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el usuario"
      ),
    );

    final txtPass = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el password",
      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.jpg")
          )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 250,
              child: Lottie.asset("assets/tecnm.json", height: 250)
            ),
            Positioned(
              bottom: 50,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(height: 10,),
                    txtPass
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}