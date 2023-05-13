import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/controllers/game_controller.dart';
import 'package:provider/provider.dart';

class GameScore extends StatelessWidget {
  final Modo modo;
  const GameScore({Key? key, required this.modo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == Modo.round6
                ? Icons.my_location
                : Icons.touch_app_rounded),
            const SizedBox(width: 10),
            Observer(
              builder: (_) => Text(
                controller.gameScore.toString(),
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
        Image.asset('images/host.png', height: 60, width: 38),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Sair', style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}
