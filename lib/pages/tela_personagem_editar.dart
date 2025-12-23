import 'package:flutter/material.dart';
import 'package:rmtools/pages/tela_listafichas.dart';


class TelaPersonagemEditar extends StatefulWidget{
  final String nomePersonagem;
  const TelaPersonagemEditar({super.key, required this.nomePersonagem});

  @override
  State<TelaPersonagemEditar> createState() => _TelaPersonagemEditarState();
}


class _TelaPersonagemEditarState extends State<TelaPersonagemEditar> {
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: SingleChildScrollView(//<--- isso faz com que eu coloque os widgets normalmente sem me preocupar com o tamanho do nome do personagem, já que ele libera um scroll caso "Falte tela"
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //***Titulo***
                Text(
                  "Ficha do(a) ${widget.nomePersonagem}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: 1000),

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

                SizedBox(height: 20),
              ],
            )
          ),
        ),
      )
    );
  }
}