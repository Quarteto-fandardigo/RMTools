import 'package:flutter/material.dart';
import 'package:rmtools/model/fichaModel/ficha.dart';
import 'package:rmtools/pages/tela_listafichas.dart';

class TelaFichabasica extends StatefulWidget {
  const TelaFichabasica({super.key});

  @override
  State<TelaFichabasica> createState() => _TelaFichabasicaState();
}

class _TelaFichabasicaState extends State<TelaFichabasica> {
  final nomeJogador = TextEditingController();
  final nomePersonagem = TextEditingController();
  double valorNP = 0;
  bool erro = false;
  bool sucesso = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Informações Básicas",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: TextField(
                      controller: nomeJogador,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Nome do Jogador",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: TextField(
                      controller: nomePersonagem,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Nome do Personagem",
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      ),
                    ),
                  ),
                  Slider(
                    value: valorNP,
                    min: 0,
                    max: 50,
                    divisions: 50,
                    label: valorNP.round().toString(),
                    onChanged: (novoValor) {
                      setState(() {
                        valorNP = novoValor;
                      });
                    },
                  ),
                  const SizedBox(height: 280),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 100),
                    ),
                    onPressed: () {
                      setState(() {
                        erro = false;
                        sucesso = false;

                        if (nomeJogador.text.isEmpty ||
                            nomePersonagem.text.isEmpty) {
                          erro = true;
                          return;
                        }

                        Ficha.criar(
                          np: valorNP,
                          nomeJogador: nomeJogador.text,
                          nomePersonagem: nomePersonagem.text,
                        );

                        sucesso = true;
                      });
                    },
                    child: const Text(
                      "Criar ficha",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaListaFicha(),
                        ),
                      );
                    },
                    child: const Text(
                      "Voltar",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (erro)
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Preencha todos os dados!",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (sucesso)
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Ficha criada com sucesso!",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 255, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
