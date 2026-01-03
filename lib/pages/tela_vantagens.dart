import 'package:flutter/material.dart';
import 'package:rmtools/model/fichaModel/armazenamento_ficha.dart';


class TelaVantagens extends StatefulWidget {
  final String nomePersonagem;
  const TelaVantagens({super.key, required this.nomePersonagem});

  @override
  State<TelaVantagens> createState() => _TelaVantagens();
}

//define se é botao ou checkbox
enum TipoVantagem {botoes, checkbox}

class _TelaVantagens extends State<TelaVantagens> {
  Map<String, int> vantagens = {};
  int pontosDisponiveis = 0;


  @override
  void initState() {
    super.initState();
    vantagens = {
      "Artífice": 0,
      "Assustar": 0,
      "Atraente": 0,
      "Bem Informado": 0,
      "Bem Relacionado": 0,
      "Contatos": 0,
      "Empatia com Animais": 0,
      "Esconder-se à Plena Vista": 0,
      "Fascinar": 0,
      "Faz Tudo": 0,
      "Ferramentas Aprimoradas": 0,
      "Finta Ágil": 0,
      "Idiomas": 0,
      "Inimigo Favorito": 0,
      "Inventor": 0,
      "Maestria em Perícia": 0,
      "Rastrear": 0,
      "Ritualista": 0,
      "Tontear": 0,
      "Zombar": 0,
      "Esforço Supremo": 0,
      "Inspirar": 0,
      "Liderança": 0,
      "Sorte de Principiante": 0,
      "Sorte": 0,
      "Tomar a Iniciativa": 0,
      "Avaliação": 0,
      "Benefício": 0,
      "Capanga": 0,
      "De Pé": 0,
      "Destemido": 0,
      "Duro de Matar": 0,
      "Equipamento": 0,
      "Esforço Extraordinário": 0,
      "Interpor-se": 0,
      "Memória Eidética": 0,
      "Parceiro": 0,
      "Segunda Chance": 0,
      "Tolerância Maior": 0,
      "Trabalho em Equipe": 0,
      "Transe": 0,
      "Ação em Movimento": 0,
      "Agarrar Aprimorado": 0,
      "Agarrar Preciso": 0,
      "Agarrar Rápido": 0,
      "Ambiente Favorito": 0,
      "Arma Improvisada": 0,
      "Armação": 0,
      "Ataque à Distância": 0,
      "Ataque Acurado": 0,
      "Ataque Corpo-a-Corpo": 0,
      "Ataque Defensivo": 0,
      "Ataque Dominó": 0,
      "Ataque Imprudente": 0,
      "Ataque Poderoso": 0,
      "Ataque Preciso": 0,
      "Crítico Aprimorado": 0,
      "Defesa Aprimorada": 0,
      "Derrubar Aprimorado": 0,
      "Desarmar Aprimorado": 0,
      "Esquiva Fabulosa": 0,
      "Estrangular": 0,
      "Evasão": 0,
      "Imobilizar Aprimorado": 0,
      "Iniciativa Aprimorada": 0,
      "Luta no Chão": 0,
      "Maestria em Arremesso": 0,
      "Mira Aprimorada": 0,
      "Prender Arma": 0,
      "Quebrar Aprimorado": 0,
      "Quebrar Arma": 0,
      "Redirecionar": 0,
      "Rolamento Defensivo": 0,
      "Saque Rápido": 0
    };
  }


  Future<void> _alterar(String chave, int delta) async {
  final repo = FichaRepository();
  final ficha = await repo.carregar(widget.nomePersonagem);
  if (ficha == null) return;

  final ok = ficha.adicionarVantagem(chave, delta);
  if (!ok) return;

  await repo.salvar(ficha);

  final novoValor = ficha.vantagens
      .where((v) => v.nome == chave)
      .map((v) => v.graduacao)
      .firstOrNull ?? 0;

  setState(() {
    vantagens[chave] = novoValor;
    pontosDisponiveis = ficha.pontosD;
  });
}

Widget vantagemUI(String nome, int valor, TipoVantagem tipo) {
  
  //***CheckBox */
  if (tipo == TipoVantagem.checkbox) {
    return CheckboxListTile(
      title: Text(nome, style: TextStyle(color: Colors.white, fontSize: 30)),
      value: vantagens[nome] == 1,
      onChanged: (v) {
        setState(() {
          vantagens[nome] = v == true ? 1 : 0; // atualiza local
        });
        _alterar(nome, v == true ? 1 : -1); // salva no model depois
      },
      activeColor: Colors.green,
    );
  }


  //***Botões */
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(nome, style: TextStyle(color: Colors.white, fontSize: 30)),
        Row(children: [
          IconButton(icon: Icon(Icons.remove, color: Colors.white), onPressed: ()=>_alterar(nome, -1)),
          Text("${vantagens[nome] ?? 0}", style: TextStyle(color: Colors.white, fontSize: 22)),
          IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: ()=>_alterar(nome, 1)),
          ])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: vantagens.entries.map((e) => vantagemUI(e.key, e.value, TipoVantagem.checkbox)).toList(),
      ),
    );

  }
}