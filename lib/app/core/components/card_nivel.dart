// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/controllers/game_controller.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/models/game_play_model.dart';
import 'package:jogo_da_memoria/app/page/game/game_page.dart';
import 'package:provider/provider.dart';

class CardNivel extends StatelessWidget {
  final GamePlay gamePlay;

  const CardNivel({
    Key? key,
    required this.gamePlay,
  }) : super(key: key);

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(
          gamePlay: gamePlay,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 90,
        width: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: gamePlay.modo == Modo.normal
                ? Colors.white
                : ThemeApp.background,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: gamePlay.modo == Modo.normal
              ? Colors.transparent
              : ThemeApp.color.withOpacity(.6),
        ),
        child: Center(
            child: Text(
          gamePlay.nivel.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )),
      ),
    );
  }
}
