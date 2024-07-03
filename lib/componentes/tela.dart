import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Tela extends StatelessWidget {
  final String texto;

  const Tela(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color.fromRGBO(197, 212, 217, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                texto,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
