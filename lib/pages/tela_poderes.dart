import 'package:flutter/material.dart';
import 'package:rmtools/pages/tela_personagem_editar.dart';

class TelaPoderes extends StatefulWidget{
  final String nomePersonagem;
  const TelaPoderes({super.key, required this.nomePersonagem});

  @override
  State<TelaPoderes> createState() => _TelaPoderesState();
}

class _TelaPoderesState extends State<TelaPoderes>{
  int pontosDisponiveis = 0;
  bool carregando = false; //<----------- ALTERAR ISSO AQ PRA ***TRUE*** QUANDO FOR FAZER O INICIALIZAR DADOS(METODO)
  final nomeComponente = TextEditingController();
  final List<String> efeitosPoderesLista = [
    "Absorção de Energia",
    "Aflição",
    "Alongamento",
    "Ambiente",
    "Armadilha",
    "Aura de Energia",
    "Campo de Força",
    "Camuflagem",
    "Característica Aumentada",
    "Característica",
    "Compreender",
    "Comunicação",
    "Controle da Sorte",
    "Controle de Elemento",
    "Controle de Energia",
    "Controle Mental",
    "Crescimento",
    "Criar",
    "Cura",
    "Dano",
    "Deflexão",
    "Duplicação",
    "Encolhimento",
    "Enfraquecer",
    "Escavação",
    "Forma Alternativa",
    "Golpe",
    "Ilusão",
    "Imitar",
    "Imortalidade",
    "Imunidade",
    "Intangibilidade",
    "Invisibilidade",
    "Invocar",
    "Leitura Mental",
    "Magia",
    "Membros Extras",
    "Metamorfo",
    "Morfar",
    "Mover Objeto",
    "Movimento",
    "Natação",
    "Nulificar",
    "Pasmar",
    "Poder de Carga",
    "Proteção",
    "Raio",
    "Rajada Mental",
    "Rapidez",
    "Regeneração",
    "Salto",
    "Sentidos",
    "Sentido Remoto",
    "Sono",
    "Sufocamento",
    "Supervelocidade",
    "Teleporte",
    "Transformação",
    "Variável",
    "Velocidade",
    "Voo"
  ];
  late String escolha;

  @override
  void initState() {
    super.initState();
    escolha = efeitosPoderesLista.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),

      //Widgets principais
      body: carregando? 
      const Center(child: CircularProgressIndicator()): Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // Botão de ajuda
                IconButton(
                  icon: const Icon(Icons.help, color: Colors.white),
                  iconSize: 35,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color.fromARGB(255, 21, 22, 34),
                        title: Text("Ajuda", style: TextStyle(color: Colors.white)),
                        content: SizedBox(
                          height: 350,
                          width: 300,
                          child: SingleChildScrollView(
                            child: Text(
                              "Vantagens custam 1 ponto por graduação. Algumas são únicas (Checkbox) e outras graduáveis (Botões).\n\n"
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
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Fechar",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 22,
                              )
                            )
                          ),
                        ]
                      ),
                    );
                  },
                ),
                // Pontos disponíveis
                Text(
                  "Pontos disponíveis: $pontosDisponiveis",
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          //***Nome do Componente */
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: TextField(
              controller: nomeComponente,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Nome do Componente",
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              ),
            ),
          ),


          //***DropDown efeitos */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            //texto
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: Text("Efeitos de Poder", 
                  style: TextStyle(fontSize:16, color:Colors.white)),
              ),
              
              //Espaçamento
              const SizedBox(height:6),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16),
                child: DropdownButtonFormField<String>(
                  initialValue: escolha,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                  items: efeitosPoderesLista.map((item) =>
                    DropdownMenuItem(value: item, child: Text(item))
                  ).toList(),
                  onChanged: (v) => setState(() => escolha = v!),
                ),
              ),
            ],
          ),


          //***Botão Voltar */
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 20),
            child: ElevatedButton(
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
          )
        ]
      )
    );
  }
}