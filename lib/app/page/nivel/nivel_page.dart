import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/components/card_nivel.dart';
import 'package:jogo_da_memoria/app/core/settings/game_setting.dart';
import 'package:jogo_da_memoria/app/models/game_play_model.dart';

class NivelPage extends StatelessWidget {
  final Modo modo;

  const NivelPage({super.key, required this.modo});

  @override
  Widget build(BuildContext context) {
    final niveis = GameSetting.niveis
        .map((e) => CardNivel(gamePlay: GamePlay(modo: modo, nivel: e)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível do Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
