import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/page/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 - Jogo da Memória',
      theme: ThemeApp.theme,
      home: const HomePage(),
    );
  }
}
