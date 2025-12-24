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
  int forca = 0;
  int agilidade =  0;
  int destreza = 0;
  int luta = 0;
  int intelecto = 0;
  int prontidao = 0;
  int presenca = 0;
  int vigor = 0;

  @override
  void initState(){
    super.initState();
    _lerJson();
  }

  Future<void> _lerJson() async{
    final repositorio = FichaRepository();
    final ficha = await repositorio.carregar(widget.nomePersonagem);

    if(ficha != null){
      setState(() {
        forca = ficha.habilidades["forca"] ?? 0;
        agilidade = ficha.habilidades["agilidade"] ?? 0;
        destreza = ficha.habilidades["destreza"] ?? 0;
        luta = ficha.habilidades["luta"] ?? 0;
        intelecto = ficha.habilidades["intelecto"] ?? 0;
        prontidao = ficha.habilidades["prontidao"] ?? 0;
        presenca = ficha.habilidades["presenca"] ?? 0;
        vigor = ficha.habilidades["vigor"] ?? 0;
      });
      
    }
  }

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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('forca', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    forca -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),

                          
                          //Texto
                          Text(
                            "$forca",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('forca', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    forca += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('agilidade', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    agilidade -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          

                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Texto
                          Text(
                            "$agilidade",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('agilidade', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    agilidade += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('destreza', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    destreza -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          

                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Texto
                          Text(
                            "$destreza",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('destreza', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    destreza += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('luta', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    luta -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          

                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Texto
                          Text(
                            "$luta",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('luta', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    luta += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('intelecto', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    intelecto -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),

                          
                          //Texto
                          Text(
                            "$intelecto",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('intelecto', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    intelecto += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('prontidao', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    prontidao -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          

                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Texto
                          Text(
                            "$prontidao",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('prontidao', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    prontidao += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('presenca', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    presenca -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          

                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Texto
                          Text(
                            "$presenca",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('presenca', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    presenca += 1;
                                  });
                                }
                              }
                            },
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

                          //Remover
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('vigor', -1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    vigor -= 1;
                                  });
                                }
                              }
                            },
                            iconSize: 30,
                            style: IconButton.styleFrom(
                              side: const BorderSide(color: Colors.white24, width: 1),//Borda
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),

                          
                          //Texto
                          Text(
                            "$vigor",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),


                          // Espaço entre o botão e o texto
                          const SizedBox(width: 15),


                          //Adicionar
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () async {
                              final repo = FichaRepository();
                              final ficha = await repo.carregar(widget.nomePersonagem);
                              if (ficha != null) {
                                final mudou = ficha.adicionarHabilidade('vigor', 1);
                                if (mudou) {
                                  await repo.salvar(ficha);
                                  setState(() {
                                    vigor += 1;
                                  });
                                }
                              }
                            },
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