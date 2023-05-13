import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/page/game/game_page.dart';

class CardNivel extends StatelessWidget {
  final Modo modo;
  final int nivel;

  const CardNivel({
    super.key,
    required this.modo,
    required this.nivel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GamePage(modo: modo, nivel: nivel),
        ),
      ),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 90,
        width: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: modo == Modo.normal ? Colors.white : ThemeApp.background,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: modo == Modo.normal
              ? Colors.transparent
              : ThemeApp.color.withOpacity(.6),
        ),
        child: Center(
            child: Text(
          nivel.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )),
      ),
    );
  }
}
