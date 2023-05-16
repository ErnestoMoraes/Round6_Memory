import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';

class RecordesPage extends StatelessWidget {
  final Modo modo;

  const RecordesPage({Key? key, required this.modo}) : super(key: key);

  getModo() {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Recordes'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 35),
            onPressed: () => Navigator.pop(context),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Modo ${getModo()}',
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 28, color: ThemeApp.color),
                    ),
                  )
                : ListTile(
                    title: Text(recordes[index]),
                    trailing: const Text('X jogadas'),
                    tileColor: Colors.grey[900],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  );
          },
          itemCount: recordes.length,
          separatorBuilder: (_, __) => const Divider(color: Colors.transparent),
        ),
      ),
    );
  }
}
