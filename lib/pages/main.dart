import 'package:flutter/material.dart';
import 'package:rmtools/pages/tela_principal.dart';

//COR BG(BACKGROUND) = 255, 21, 22, 34
//COR BOTOES = COLOR.WHITE

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal()
    );
  }
}
void main() {
  runApp(
    const MyApp()
  );
}