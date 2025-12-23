import 'package:flutter/material.dart';
import 'package:rmtools/pages/tela_fichabasica.dart';
import 'package:rmtools/pages/tela_principal.dart';
import 'package:rmtools/model/fichaModel/armazenamento_ficha.dart';


class TelaListaFicha extends StatefulWidget { 
  const TelaListaFicha({super.key}); 
  
  @override
  State<TelaListaFicha> createState() => _TelaFichaState();
}


class _TelaFichaState extends State<TelaListaFicha> {
  List<String> fichas = [];
  int? selecionado;
  
  Future<void> carregarFichas() async {
    final retorno = await FichaRepository().listarFichas();

    setState(() {
      fichas = retorno;
    });
  }

  @override
  void initState(){
    super.initState();
    carregarFichas();
  }

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

              
              //Espaçamento
              const SizedBox(height: 20),

              
              //***Lista scrollável***

              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    selecionado = null;
                  });
                },
                child: Container(
                  width: 300,
                  height: 520,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 49, 48, 48),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  // listview de fato
                  child: Column(
                    children: [
                      // lista
                      SizedBox(
                        height: 420,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: fichas.length,
                          itemBuilder: (context, index) {
                            final ativo = selecionado == index;

                            // Toque
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selecionado = index;
                                });
                              },

                              // label de seleção
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: ativo
                                      ? const Color.fromARGB(255, 90, 90, 120)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  fichas[index],
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      //***Espaçamento
                      Spacer(),

                      //***Botões***
                      if (selecionado != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              //***Excluir***
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  minimumSize: const Size(140, 40),
                                  foregroundColor: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: 25
                                  )
                                ),
                                onPressed: () {
                                  setState((){
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false, //<-- isso nao deixa clicar fora para sair
                                      builder: (BuildContext context){
                                        return AlertDialog(
                                          backgroundColor: const Color.fromARGB(255, 21, 22, 34),
                                          title: Text(
                                            "Confimação",
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                          content: Text(
                                            "Tem certeza que deseja excluir esta ficha?",
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                          actions: [
                                            
                                            //***Cancelar
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();//<-- fecha o pop-up
                                              },

                                              child: Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                  color: Colors.grey
                                                ),
                                              ),
                                            ),

                                            //***Excluir***
                                            TextButton(
                                              onPressed: () async {
                                                final repo = FichaRepository();
                                                await repo.excluir(fichas[selecionado!]);

                                                setState(() {
                                                  fichas.removeAt(selecionado!); 
                                                  selecionado = null;
                                                });

                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Excluir",
                                                style: TextStyle(color: Colors.redAccent),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                                },
                                child: const Text("Excluir"),
                              ),

                              //***Editar***
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  minimumSize: const Size(140, 40),
                                  foregroundColor: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: 25
                                  )
                                ),
                                onPressed: () {
                                  //fazer a transição de telas
                                },
                              child: const Text("Editar"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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