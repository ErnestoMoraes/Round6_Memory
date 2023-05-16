import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jogo_da_memoria/app/controllers/game_controller.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/page/home/home_page.dart';
import 'package:jogo_da_memoria/app/repositories/records_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        Provider<RecordsRepository>(
          create: (_) => RecordsRepository(),
        ),
        ProxyProvider<RecordsRepository, GameController>(
          update: (_, repo, __) => GameController(recordesRepository: repo),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 - Jogo da Memória',
      theme: ThemeApp.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
