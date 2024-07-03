import 'package:flutter/material.dart';
import 'botao.dart';

class LinhaDeBotao extends StatelessWidget {
  final List<Botao> botoes;

  const LinhaDeBotao(this.botoes);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoes,
      ),
    );
  }
}
