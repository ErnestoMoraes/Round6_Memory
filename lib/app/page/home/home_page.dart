import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/components/logo.dart';
import 'package:jogo_da_memoria/app/core/components/recordes.dart';
import 'package:jogo_da_memoria/app/core/components/start_button.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/page/nivel/nivel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Modo Normal',
              color: Colors.white,
              action: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NivelPage(modo: Modo.normal))),
            ),
            StartButton(
              title: 'Modo Round 6',
              color: ThemeApp.color,
              action: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NivelPage(modo: Modo.round6))),
            ),
            const SizedBox(height: 60),
            const Recordes(),
          ],
        ),
      ),
    );
  }
}
