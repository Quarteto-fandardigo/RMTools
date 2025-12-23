import 'package:flutter/material.dart';


class TelaHabilidades extends StatefulWidget{
  const TelaHabilidades({super.key});

  @override
  State<TelaHabilidades> createState() => _TelaHabilidadesState();
}


class _TelaHabilidadesState extends State<TelaHabilidades> {
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //***Titulo***
              Text("")
            ],
          )
        ),
      ),
    );
  }
}