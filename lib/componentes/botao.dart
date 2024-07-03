import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;

  Botao({
    required this.texto,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(249, 221, 164, 1),
        ),
        onPressed: onPressed,
        child: Text(
          texto,
          style: TextStyle(
            color: Color.fromRGBO(47, 50, 81, 1),
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
