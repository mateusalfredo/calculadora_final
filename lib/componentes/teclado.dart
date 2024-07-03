import 'package:flutter/material.dart';
import 'linha_de_botao.dart';
import 'botao.dart';

class Teclado extends StatelessWidget {
  final void Function(String) onButtonPressed;

  Teclado({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          LinhaDeBotao([
            Botao(texto: 'C', onPressed: () => onButtonPressed('C')),
            Botao(texto: 'Del', onPressed: () => onButtonPressed('Del')),
          ]),
          LinhaDeBotao([
            Botao(texto: '7', onPressed: () => onButtonPressed('7')),
            Botao(texto: '8', onPressed: () => onButtonPressed('8')),
            Botao(texto: '9', onPressed: () => onButtonPressed('9')),
            Botao(texto: '/', onPressed: () => onButtonPressed('/')),
          ]),
          LinhaDeBotao([
            Botao(texto: '4', onPressed: () => onButtonPressed('4')),
            Botao(texto: '5', onPressed: () => onButtonPressed('5')),
            Botao(texto: '6', onPressed: () => onButtonPressed('6')),
            Botao(texto: 'X', onPressed: () => onButtonPressed('*')),
          ]),
          LinhaDeBotao([
            Botao(texto: '1', onPressed: () => onButtonPressed('1')),
            Botao(texto: '2', onPressed: () => onButtonPressed('2')),
            Botao(texto: '3', onPressed: () => onButtonPressed('3')),
            Botao(texto: '-', onPressed: () => onButtonPressed('-')),
          ]),
          LinhaDeBotao([
            Botao(texto: '0', onPressed: () => onButtonPressed('0')),
            Botao(texto: '.', onPressed: () => onButtonPressed('.')),
            Botao(texto: '=', onPressed: () => onButtonPressed('=')),
            Botao(texto: '+', onPressed: () => onButtonPressed('+')),
          ]),
        ],
      ),
    );
  }
}
