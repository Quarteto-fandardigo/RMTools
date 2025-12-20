//import 'package:flutter/material.dart';

class Modificador {
  final String nome;
  final int valor;
  final bool porGraduacao;

  Modificador({
    required this.nome,
    required this.valor,
    required this.porGraduacao,
  });
}

class Componente{
  final String nomeComponente;
  final String efeito;
  final int graduacao;
  final int custoBase;
  final Map<String, Modificador> extras;
  final Map<String, Modificador> falhas;

  Componente({
    required this.nomeComponente,
    required this.efeito,
    required this.graduacao,
    required this.custoBase,
    Map<String, Modificador>? extras,
    Map<String, Modificador>? falhas,
  })  : extras = extras ?? {},
        falhas = falhas ?? {};
// extras ?? {}, se extras nao for nulo use ele,se for use {}
}

class Poder{
  final String nomePoder;
  final Map<String,Modificador> extras;
  final Map<String,Modificador> falhas;
  List<Componente> componentes = [];

  Poder({
    required this.nomePoder,
    Map<String, Modificador>? extras,
    Map<String, Modificador>? falhas,
  })  : extras = extras ?? {},
        falhas = falhas ?? {};
  }

class Vantagem {
  final String nome;
  final int graduacao;
  final int custo;

  Vantagem({
    required this.nome,
    required this.graduacao,
    required this.custo,
  });
}

class Pericia {

  final String nome;
  final int bonus;
  final int graduacao;
  final int custo;

  Pericia({
    required this.nome,
    required this.graduacao,
    required this.bonus,
    required this.custo,
  });

}

class Ficha{

  final int np;
  final String nomeJogador;
  final String nomePersonagem;
  
  Map<String, int> habilidades = {
    'forca': 0,
    'agilidade': 0,
    'destreza': 0,
    'luta': 0,
    'intelecto': 0,
    'prontidao': 0,
    'presenca': 0,
    'vigor': 0,
  };
  List<Vantagem> vantagens = [];
  List<Pericia> pericias = [];
  List<Poder> poderes = [];
  

   Ficha._(
    this.np,
    this.nomeJogador,
    this.nomePersonagem,
    this.habilidades,
    this.vantagens,
    this.pericias,
    this.poderes,
  );

  //factory usado para criar objetos, um construtor que decide como e se um objeto será criado, cabe logica dentro deste.
  factory Ficha.criar({
    required int np,
    required String nomeJogador,
    required String nomePersonagem
  }){
     return Ficha._(
      np,
      nomeJogador,
      nomePersonagem,
      {
        'forca': 0,
        'agilidade': 0,
        'destreza': 0,
        'luta': 0,
        'intelecto': 0,
        'prontidao': 0,
        'presenca': 0,
        'vigor': 0,
      },
      [],
      [],
      [],
    );
  }


// funcao para criar ficha
Ficha criarFicha({ required int np ,required String nomeJogador ,required String nomePersonagem})  
  {return Ficha.criar(np: np, nomeJogador: nomeJogador, nomePersonagem: nomePersonagem);}

Ficha adicionarHabilidade({required Map<String,int> novashabilidades
  }){
      novashabilidades.forEach((chave, valor) {
      if (habilidades.containsKey(chave)) {
        habilidades[chave] = valor;
      }
    });

    return this;

  }

Ficha adicionarPericia({ required String nome, required int bonus,required int graduacao,required int custo
  }){
    pericias.add(Pericia(nome:nome,bonus:bonus,graduacao:graduacao,custo:custo));
    return this;

  }

Ficha adicionarVantagem({required String nome, required int graduacao, required int custo
}){
  vantagens.add(Vantagem(nome: nome, graduacao: graduacao, custo: custo));
  return this;
}

Ficha adicionarPoderes({required String nome
}){

  poderes.add(Poder(nomePoder: nome));
  return this;

}



}


