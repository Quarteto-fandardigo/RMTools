import 'package:flutter/material.dart';
import 'package:rmtools/pages/tela_fichabasica.dart';
import 'package:rmtools/pages/tela_principal.dart';


class TelaFicha extends StatefulWidget { 
  const TelaFicha({super.key}); 
  
  @override
  State<TelaFicha> createState() => _TelaFichaState();
}


class _TelaFichaState extends State<TelaFicha> {
  List<String> fichas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              
              //***Título***
              Text(
                "Fichas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              
              
              //***Lista scrollável***
              Container(
                  width: 300,
                  height: 520,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 49, 48, 48),
                    borderRadius: BorderRadius.circular                                                             (15),
                  ),
                  child: ListView.builder(
                    itemCount: fichas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          fichas[index],
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                          ),
                        ),
                      );
                    },
                  ),
                ),


              
              //***Espaçamento***
              const SizedBox(height: 20),



              //***Botão Adicionar ficha***
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaFichabasica()
                    )
                  );
                },
                child: const Text(
                  "Adicionar ficha",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              


              //***Espaçamento***
              const SizedBox(height: 20),



              //***Botão Voltar***
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaPrincipal(),
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
        )
      ),
    );
  }
}