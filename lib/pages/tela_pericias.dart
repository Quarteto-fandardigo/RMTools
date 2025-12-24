import 'package:flutter/material.dart';

class TelaPericias extends StatefulWidget{
  final String nomePersonagem;
  const TelaPericias({super.key, required this.nomePersonagem});

  @override
  State<TelaPericias> createState() => _TelaPericias();
}

class _TelaPericias extends State<TelaPericias>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      
    );
  }
}