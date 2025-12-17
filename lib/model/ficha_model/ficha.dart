class Componente{
  final String nomeComponente;
  final String efeito;
  final int graduacao;
  final int custoBase;
  final Map<String, int> extras;
  final Map<String, int> falhas;

  Componente({
    required this.nomeComponente,
    required this.efeito,
    required this.graduacao,
    required this.custoBase,
    Map<String, int>? extras,
    Map<String, int>? falhas,
  })  : extras = extras ?? {},
        falhas = falhas ?? {};

}

class Poder{
  final String nomePoder;
  final Map<String,int> extras;
  final Map<String,int> falhas;

  Poder({
    required this.nomePoder,
    Map<String, int>? extras,
    Map<String, int>? falhas,
  })  : extras = extras ?? {},
        falhas = falhas ?? {};
  }

class Ficha{

  final int np ;
  final String nomeJogador;
  final String nomePersonagem;



  Ficha(this.np,this.nomeJogador,this.nomePersonagem);


}