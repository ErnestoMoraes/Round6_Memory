import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';

class CardGame extends StatefulWidget {
  final Modo modo;
  final int opcao;

  const CardGame({
    super.key,
    required this.modo,
    required this.opcao,
  });

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.modo == Modo.normal ? Colors.white : ThemeApp.color,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        image: DecorationImage(
          image:widget.modo == Modo.normal
              ? const AssetImage('images/card_normal.png')
              : const AssetImage('images/card_round.png'),
          fit: BoxFit.cover,
        ),
      ),
      
    );
  }
}
