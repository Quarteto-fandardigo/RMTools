import 'package:flutter/material.dart';
import 'package:rmtools/model/fichaModel/ficha.dart';

class TelaFichabasica extends StatefulWidget {
  const TelaFichabasica({super.key});

  @override
  State<TelaFichabasica> createState() => _TelaFichabasicaState();
}

class _TelaFichabasicaState extends State<TelaFichabasica> {
  final nomeJogador = TextEditingController();
  final nomePersonagem = TextEditingController();
  double valorNP = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              

              //***Titulo***
              Text(
                "Informações Básicas",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),


              //***espaçamento***
              const SizedBox(height: 40),


              //***Campo Nome Jogador ***
              Center(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: nomeJogador,
                    decoration: 
                    InputDecoration(
                      labelText: "Nome do Jogador",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)
                    )
                  )
                ),
              ),
              

              //***Campo Nome Personagem ***
              Center(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: nomePersonagem,
                    decoration: 
                    InputDecoration(
                      labelText: "Nome do Personagem",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    )
                  )
                ),
              ),


              //***Slider***
              Slider(
                value: valorNP,
                min: 0,
                max: 50,
                divisions: 50,
                label: valorNP.round().toString(),
                onChanged: (novoValor){
                  setState(() {
                    valorNP = novoValor;
                  });
                }
              ),


              //***espaçamento***
              const SizedBox(height: 350),
              

              //***Botao Criar Ficha***
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100),
                ),
                onPressed: () {
                  final teste = Ficha.criar(
                    np: valorNP,
                    nomeJogador: nomeJogador.text,
                    nomePersonagem: nomePersonagem.text
                  );
                },
                child: const Text(
                  "Criar ficha",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}

