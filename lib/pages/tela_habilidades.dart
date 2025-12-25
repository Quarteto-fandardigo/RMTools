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
  void initState(){
    super.initState();
    _lerJson();
  }
    
  int forca = 0;
  int agilidade =  0;
  int destreza = 0;
  int luta = 0;
  int intelecto = 0;
  int prontidao = 0;
  int presenca = 0;
  int vigor = 0;
  int pontosDisponiveis = 0;

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
        pontosDisponiveis = ficha.pontosD;
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

                //***Botao de duvida***
                IconButton(
                  icon: Icon(Icons.help),
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 21, 22, 34),
                        title: Text("Ajuda", style: TextStyle(color: Colors.white)),
                        content: SizedBox(
                          height: 350,
                          width: 300,
                          child: SingleChildScrollView(
                            child: Text(
                              "Habilidades são como o sistema chama os atributos, ex: força. "
                              "Cada graduação em uma habilidade custa 2 pontos de poder, retirar concede 2 pontos,"
                              " contudo tem um limite de quanto você consegue retirar de graduações, o limite é até -5 de graduação"
                              "Segue a escala (material oficial):\n\n"
                              "-5 — Completamente inepto\n"
                              "-4 — Criança muito nova (<6 anos)\n"
                              "-3 — Criança nova (7-9)\n"
                              "-2 — Criança (10-13), idoso ou debilitado\n"
                              "-1 — Abaixo da média; adolescente\n"
                              "0 — Adulto médio\n"
                              "1 — Acima da média\n"
                              "2 — Bem acima da média\n"
                              "3 — Talentoso\n"
                              "4 — Altamente talentoso\n"
                              "5 — O melhor de um país\n"
                              "6 — Um dos melhores do mundo\n"
                              "7 — Ápice humano\n"
                              "8 — Super-humano fraco\n"
                              "10 — Super-humano moderado\n"
                              "13 — Super-humano poderoso\n"
                              "15 — Super-humano muito poderoso\n"
                              "20 — Cósmico",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();//<-- fecha o pop-up
                            },
                            child: Text(
                              "Fechar",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),                   
                    );
                  },
                ),
                

                //***FutureBuilder para ele ler somente quando o arquivo for escrito, ou seja, dps
                Text(
                  "Pontos disponíveis: $pontosDisponiveis",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
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
                                    forca = ficha.habilidades['forca'] ?? forca;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    forca = ficha.habilidades['forca'] ?? forca;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    agilidade = ficha.habilidades['agilidade'] ?? agilidade;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    agilidade = ficha.habilidades['agilidade'] ?? agilidade;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    destreza = ficha.habilidades['destreza'] ?? destreza;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    destreza = ficha.habilidades['destreza'] ?? destreza;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    luta = ficha.habilidades['luta'] ?? luta;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    luta = ficha.habilidades['luta'] ?? luta;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    intelecto = ficha.habilidades['intelecto'] ?? intelecto;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    intelecto = ficha.habilidades['intelecto'] ?? intelecto;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    prontidao = ficha.habilidades['prontidao'] ?? prontidao;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    prontidao = ficha.habilidades['prontidao'] ?? prontidao;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    presenca = ficha.habilidades['presenca'] ?? presenca;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    presenca = ficha.habilidades['presenca'] ?? presenca;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    vigor = ficha.habilidades['vigor'] ?? vigor;
                                    pontosDisponiveis = ficha.pontosD;
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
                                    vigor = ficha.habilidades['vigor'] ?? vigor;
                                    pontosDisponiveis = ficha.pontosD;
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