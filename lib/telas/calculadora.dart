import 'package:flutter/material.dart';
import 'package:atividadeavaliativa/componentes/teclado.dart';
import 'package:atividadeavaliativa/componentes/tela.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _textoVisor = '';
  String _n1 = '';
  String _n2 = '';
  String _operador = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Calculadora')),
        body: Column(
          children: [
            Tela(_textoVisor),
            Teclado(onButtonPressed: _onButtonPressed),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _limpar();
      } else if (value == 'Del') {
        _deletar();
      } else if (_ehOperador(value)) {
        _armazenarOperador(value);
      } else if (value == '=') {
        _calcularResultado();
      } else {
        _adicionarAoVisor(value);
      }
    });
  }

  bool _ehOperador(String value) {
    return value == '+' || value == '-' || value == '*' || value == '/';
  }

  void _limpar() {
    _textoVisor = '';
    _n1 = '';
    _n2 = '';
    _operador = '';
  }

  void _deletar() {
    if (_textoVisor.isNotEmpty) {
      _textoVisor = _textoVisor.substring(0, _textoVisor.length - 1);
      if (_operador.isEmpty) {
        if (_n1.isNotEmpty) {
          _n1 = _n1.substring(0, _n1.length - 1);
        }
      } else {
        if (_n2.isNotEmpty) {
          _n2 = _n2.substring(0, _n2.length - 1);
        }
      }
    }
  }

  void _adicionarAoVisor(String value) {
    _textoVisor += value;
    if (_operador.isEmpty) {
      _n1 += value;
    } else {
      _n2 += value;
    }
  }

  void _armazenarOperador(String operador) {
    if (_n1.isNotEmpty) {
      _operador = operador;
      _textoVisor += operador;
    }
  }

  void _calcularResultado() {
    if (_textoVisor.isEmpty) return;

    List<String> tokens = _tokenizar(_textoVisor);

    List<String> tokensIntermediarios =
        _resolverMultiplicacoesEDivisoes(tokens);

    if (_textoVisor == 'Erro') {
      return;
    }

    double resultado = _resolverSomasESubtracoes(tokensIntermediarios);

    setState(() {
      _textoVisor = resultado.toString();
      _n1 = resultado.toString();
      _n2 = '';
      _operador = '';
    });
  }

  List<String> _tokenizar(String expressao) {
    List<String> tokens = [];
    String numero = '';

    for (int i = 0; i < expressao.length; i++) {
      String char = expressao[i];

      if (_ehOperador(char)) {
        if (numero.isNotEmpty) {
          tokens.add(numero);
          numero = '';
        }
        tokens.add(char);
      } else {
        numero += char;
      }
    }

    if (numero.isNotEmpty) {
      tokens.add(numero);
    }

    return tokens;
  }

  List<String> _resolverMultiplicacoesEDivisoes(List<String> tokens) {
    List<String> resultado = [];
    double acumulador;
    String operadorAnterior;

    for (int i = 0; i < tokens.length; i++) {
      String token = tokens[i];

      if (token == '*' || token == '/') {
        operadorAnterior = token;
        double num1 = double.parse(resultado.removeLast());
        double num2 = double.parse(tokens[++i]);

        if (operadorAnterior == '*') {
          acumulador = num1 * num2;
          resultado.add(acumulador.toString());
        } else {
          if (num2 == 0) {
            setState(() {
              _textoVisor = 'Erro';
            });
            return [];
          } else {
            acumulador = num1 / num2;
            resultado.add(acumulador.toString());
          }
        }
      } else {
        resultado.add(token);
      }
    }

    return resultado;
  }

  double _resolverSomasESubtracoes(List<String> tokens) {
    double resultado = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operador = tokens[i];
      double num = double.parse(tokens[i + 1]);

      if (operador == '+') {
        resultado += num;
      } else if (operador == '-') {
        resultado -= num;
      }
    }

    return resultado;
  }
}
