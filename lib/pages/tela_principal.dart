import 'package:flutter/material.dart';


class TelaPrincipal extends StatelessWidget{
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //Scafold evita a linha amarela(sublinhado) no que tiver acima(eu acho)
        backgroundColor: const Color.fromARGB(255, 21, 22, 34),
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                //***Titulo*** 
                Text(
                  'RMTools',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                

                //***espaçamento***
                const SizedBox(height: 40),


                //***BOTÃO*** CONSTRUIR_FICHA
                ElevatedButton(
                  
                  //tamanho botão
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 100)
                  ),

                  //função botão
                  onPressed: () {},
                  
                  //texto botão
                  child: const Text(
                    "Ficha", 
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),


                //***espaçamento***
                const SizedBox(height: 40),


                //***BOTÃO*** MESTRAGEM
                ElevatedButton(
                  
                  //tamanho botão
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 100)
                  ),

                  //função botão
                  onPressed: () {},
                  
                  //texto botão
                  child: const Text(
                    "Mestragem", 
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              
              
                //***espaçamento***
                const SizedBox(height: 400),


                //***TEXTO ABAIXO***
                Text(
                  'Idealizado, pensado e desenvolvido por Neto Porto e Kauã Keven',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}