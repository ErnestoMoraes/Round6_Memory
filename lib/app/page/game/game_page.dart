import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/controllers/game_controller.dart';
import 'package:jogo_da_memoria/app/core/components/card_game.dart';
import 'package:jogo_da_memoria/app/core/components/game_score.dart';
import 'package:jogo_da_memoria/app/core/settings/game_setting.dart';
import 'package:jogo_da_memoria/app/models/game_opcao_model.dart';
import 'package:jogo_da_memoria/app/models/game_play_model.dart';
import 'package:jogo_da_memoria/app/page/finaly/finaly_page.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;

  const GamePage({super.key, required this.gamePlay});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<GameController>();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: GameScore(
            modo: gamePlay.modo,
          )),
      body: Observer(
        builder: (_) {
          if (controller.venceu) {
            return const FinalyPage(
              resultado: Resultado.aprovado,
            );
          } else if (controller.perdeu) {
            return const FinalyPage(
              resultado: Resultado.eliminado,
            );
          } else {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: GameSetting.gameBoardAxisCount(gamePlay.nivel),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                padding: const EdgeInsets.all(24),
                children: controller.gameCards
                    .map((GameOpcao go) => CardGame(
                          modo: gamePlay.modo,
                          gameOpcao: go,
                        ))
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
