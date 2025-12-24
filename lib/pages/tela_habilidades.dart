import 'package:flutter/material.dart';
import 'package:rmtools/model/fichaModel/armazenamento_ficha.dart';

class TelaHabilidades extends StatefulWidget{
  final String nomePersonagem;
  const TelaHabilidades({super.key, required this.nomePersonagem});

  @override
  State<TelaHabilidades> createState() => _TelaHabilidades();
}

class _TelaHabilidades extends State<TelaHabilidades>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.help),
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () {},
                ),
                

                //***FutureBuilder para ele ler somente quando o arquivo for escrito, ou seja, dps
                FutureBuilder<int?>(
                  future: FichaRepository().carregarCampoInt("pontosD", widget.nomePersonagem),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    }


                    final pontos = snapshot.data ?? 0;

                    //***Texto Pontos Disponíveis***
                    return Text(
                      "Pontos disponíveis: $pontos",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  //***Força***
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        //Texto stepper Força
                        Text(
                          "Força:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        

                        //***Stepper***
                        Row(
                          children: [

                            //Adicionar
                            IconButton(
                              icon: Icon(Icons.remove, color: Colors.white),
                              onPressed: () {},
                              iconSize: 30,
                            ),
                            
                            //Texto
                            Text(
                              "10",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),

                            //Remover
                            IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: () {},
                              iconSize: 30,
                            )
                          ],
                        )
                      ],
                    )
                  ),










                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}