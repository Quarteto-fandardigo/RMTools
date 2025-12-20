import 'package:flutter/material.dart';
import 'package:rmtools/pages/tela_principal.dart';

class TelaFicha extends StatelessWidget{
  const TelaFicha({super.key});

  @override
  Widget build(BuildContext context){
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
              Text("Fichas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),


              //***espaçamento***
              const SizedBox(height: 40), 


              //***Botao CRIAR FICHA***
              ElevatedButton(

                //tamanho botao
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100)
                ),

                //funcao botao
                onPressed: () {},

                //texto botao
                child: const Text(
                  "Criar ficha",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),


              //***espaçamento***
              const SizedBox(height: 530), 

              //***Botao Voltar
              ElevatedButton(

                //tamanho botao
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50)
                ),

                //funcao botao
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaPrincipal(),
                    ),
                  );
                },

                //texto botao
                child: const Text(
                  "Voltar",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}