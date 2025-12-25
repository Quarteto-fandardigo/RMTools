import 'package:flutter/material.dart';
import 'package:rmtools/model/fichaModel/armazenamento_ficha.dart';

class TelaPericias extends StatefulWidget {
  final String nomePersonagem;
  const TelaPericias({super.key, required this.nomePersonagem});

  @override
  State<TelaPericias> createState() => _TelaPericias();
}

class _TelaPericias extends State<TelaPericias> {
  Map<String, int> pericias = {};
  int pontosDisponiveis = 0;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    _lerJson();
  }

  Future<void> _lerJson() async {
    final repo = FichaRepository();
    final ficha = await repo.carregar(widget.nomePersonagem);

    setState(() {
      if (ficha != null) {
        pericias = {
          for (var p in ficha.pericias) p.nome: p.graduacao,
        };
        pontosDisponiveis = ficha.pontosD;
      }
      carregando = false; // ← SEMPRE
    });
  }

  Future<void> _alterar(String chave, int delta) async {
    final repo = FichaRepository();
    final ficha = await repo.carregar(widget.nomePersonagem);

    if (ficha != null && ficha.adicionarPericia(chave, delta)) {
      await repo.salvar(ficha);

      final novaGraduacao = ficha.pericias
          .firstWhere((p) => p.nome == chave)
          .graduacao;

      setState(() {
        pericias[chave] = novaGraduacao;
        pontosDisponiveis = ficha.pontosD;
      });
    }
  }

  Widget _linhaPericia(String nome, int valor) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nome[0].toUpperCase() + nome.substring(1),
            style: const TextStyle(color: Colors.white, fontSize: 36),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                iconSize: 30,
                onPressed: () => _alterar(nome, -1),
              ),
              const SizedBox(width: 15),
              Text(
                '$valor',
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
              const SizedBox(width: 15),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                iconSize: 30,
                onPressed: () => _alterar(nome, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 22, 34),
    );
  }
}