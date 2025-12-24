import 'package:flutter/material.dart';
import 'package:rmtools/model/fichaModel/armazenamento_ficha.dart';
import 'package:rmtools/pages/tela_personagem_editar.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),
                

                //***Agilidade***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Agilidade:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                //***Destreza***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Destreza:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                //***Luta***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Luta:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                //***Intelecto***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Intelecto:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                //***Prontidão***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Prontidão:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                //***Presença***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Presença:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                //***Vigor***
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      //Texto stepper Força
                      Text(
                        "Vigor:",
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
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
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),


                SizedBox(height: MediaQuery.of(context).size.height * 0.065),


                //***Botao Voltar***
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaPersonagemEditar(nomePersonagem: widget.nomePersonagem),
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
        ],
      ),
    );
  }
}