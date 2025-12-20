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
}

//teste 