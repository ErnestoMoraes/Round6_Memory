import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/components/start_button.dart';

class FinalyPage extends StatefulWidget {
  final Resultado resultado;

  const FinalyPage({super.key, required this.resultado});

  @override
  State<FinalyPage> createState() => _FinalyPageState();
}

class _FinalyPageState extends State<FinalyPage> {
  // String getResultado() {
  //   return resultado == Resultado.aprovado ? 'Vencedor' : 'Eliminado';
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   '${getResultado().toUpperCase()}!',
          //   style: const TextStyle(fontSize: 30),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 30),
          //   child: Image.asset('images/${getResultado()}.png'),
          // ),
          // resultado == Resultado.eliminado
          //     ? StartButton(
          //         title: 'Tentar novamente', color: Colors.white, action: () {})
          //     : StartButton(
          //         title: 'Jogar novamente', color: Colors.white, action: () {})
        ],
      ),
    );
  }
}
