//import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';



class Modificador {
  final String nome;
  final int valor;
  final bool porGraduacao;

  Modificador({
    required this.nome,
    required this.valor,
    required this.porGraduacao,
  });

  Map<String,dynamic> toJson(){
    return{
      'nome':nome,
      'valor':valor,
      'porGraduacao':porGraduacao
    };
  }

  factory Modificador.fromJson(Map<String,dynamic> json){
    return Modificador(
      nome: json['nome'],
      valor: json['valor'],
      porGraduacao: json['porGraduacao']
    );
  }



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


  Map<String,dynamic> toJson(){
    return{
      'nomeComponente':nomeComponente,
      'efeito':efeito,
      'graduacao':graduacao,
      'custoBase':custoBase,
       'extras': extras.map(
      (key, value) => MapEntry(key, value.toJson()),
    ),
    'falhas': falhas.map(
      (key, value) => MapEntry(key, value.toJson()),
    ),
    };
  }

  factory Componente.fromJson(Map<String,dynamic>json){
    return Componente(
      nomeComponente: json['nomeComponente'],
      efeito: json['efeito'],
      graduacao: json['graduacao'],
      custoBase: json['custoBase'],
      extras: json['extras'] != null
        ? (json['extras'] as Map<String, dynamic>)
            .map((key, value) =>
                MapEntry(key, Modificador.fromJson(value)))
        : {},
    falhas: json['falhas'] != null
        ? (json['falhas'] as Map<String, dynamic>)
            .map((key, value) =>
                MapEntry(key, Modificador.fromJson(value)))
        : {},
    );


  } 

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


  Map<String,dynamic> toJson(){
    return{
      'nomePoder':nomePoder,
      'extras': extras.map(
      (key, value) => MapEntry(key, value.toJson()),
    ),
    'falhas': falhas.map(
      (key, value) => MapEntry(key, value.toJson()),
    ),
    'componentes': componentes.map((c) => c.toJson()).toList()
    
    };
  }

 factory Poder.fromJson(Map<String, dynamic> json) {
  final poder = Poder(
    nomePoder: json['nomePoder'],
    extras: json['extras'] != null
        ? (json['extras'] as Map<String, dynamic>)
            .map((key, value) =>
                MapEntry(key, Modificador.fromJson(value)))
        : {},
    falhas: json['falhas'] != null
        ? (json['falhas'] as Map<String, dynamic>)
            .map((key, value) =>
                MapEntry(key, Modificador.fromJson(value)))
        : {},
  );

  // AQUI entra a lista de componentes
  if (json['componentes'] != null) {
    poder.componentes.addAll(
      (json['componentes'] as List<dynamic>)
          .map((c) => Componente.fromJson(c)),
    );
  }

  return poder;
  }

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


  Map<String,dynamic> toJson(){
    return{
      'nome':nome,
      'graduacao':graduacao,
      'custo':custo
    };
  }


  factory Vantagem.fromJson(Map<String,dynamic>json){
    return Vantagem(
      nome: json['nome'],
      graduacao: json['graduacao'],
      custo: json['custo']
    );
  }



  bool alterarVantagem(){


    return true;
  }


}

class Pericia {

  final String nome;
  int? bonus;
  final int graduacao;
  final int custo;

  Pericia({
    required this.nome,
    required this.graduacao,
    this.bonus,
    required this.custo,
  });


  Map<String,dynamic> toJson(){
    return {
      'nome':nome,
      'graduacao':graduacao,
      'bonus':bonus,
      'custo':custo
    };
  }

  factory Pericia.fromJson(Map<String,dynamic> json){
    return Pericia(
      nome:json['nome'],
      graduacao: json['graduacao'],
      bonus: json['bonus'],
      custo: json['custo']
    );

  }


}

class Ficha{

  final double np;
  final String nomeJogador;
  final String nomePersonagem;
  final double pontosBase ;
  double pontosD;
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
  
  //CONSRUTOR DA FICHA NORMAL
   Ficha._(
    this.np,
    this.nomeJogador,
    this.nomePersonagem,
    this.habilidades,
    this.vantagens,
    this.pericias,
    this.poderes, 
  ) : pontosBase = np*15,
      pontosD=np*15;

  //factory usado para criar objetos, um construtor que decide como e se um objeto será criado, cabe logica dentro deste.
  factory Ficha.criar({
    required double np,
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
Ficha criarFicha({ required double np ,required String nomeJogador ,required String nomePersonagem})  
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

Ficha adicionarPericia({ required String nome,required int graduacao,required int custo
  }){
    pericias.add(Pericia(nome:nome,graduacao:graduacao,custo:custo));
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


Map<String, dynamic> toJson() {
  return {
    'np': np,
    'nomeJogador': nomeJogador,
    'nomePersonagem': nomePersonagem,
    'habilidades': habilidades,
    'vantagens': vantagens.map((v) => v.toJson()).toList(),
    'pericias': pericias.map((p) => p.toJson()).toList(),
    'poderes': poderes.map((p) => p.toJson()).toList(),
    'pontosBase': pontosBase,
    'pontosD': pontosD,
  };
}

//CONSTRUTOR PARA O JSON
Ficha._fromJson(
  this.np,
  this.nomeJogador,
  this.nomePersonagem,
  this.habilidades,
  this.vantagens,
  this.pericias,
  this.poderes,
  this.pontosD,
) : pontosBase = np * 15;

factory Ficha.fromJson(Map<String, dynamic> json) {
  return Ficha._fromJson(
    (json['np'] as num).toDouble(),
    json['nomeJogador'],
    json['nomePersonagem'],
    Map<String, int>.from(json['habilidades']),
    (json['vantagens'] as List<dynamic>)
        .map((v) => Vantagem.fromJson(v))
        .toList(),
    (json['pericias'] as List<dynamic>)
        .map((p) => Pericia.fromJson(p))
        .toList(),
    (json['poderes'] as List<dynamic>)
        .map((p) => Poder.fromJson(p))
        .toList(),
    (json['pontosD'] as num).toDouble()  
  );
}




}


