import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/repositories/records_repository.dart';
import 'package:provider/provider.dart';

class RecordesPage extends StatelessWidget {
  final Modo modo;

  const RecordesPage({Key? key, required this.modo}) : super(key: key);

  getModo() {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  List<Widget> getRecordesList(Map recordes) {
    final List<Widget> widgtes = [];

    recordes.forEach((nivel, score) {
      widgtes.add(ListTile(
        title: Text('Nivel $nivel'),
        trailing: Text('$score'),
        tileColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ));

      widgtes.add(const Divider(color: Colors.transparent));
    });

    if (widgtes.isEmpty) {
      widgtes.add(
        const Center(
          child: Text('Sem recordes ainda'),
        ),
      );
    }
    return widgtes;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<RecordsRepository>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Recordes'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 35),
            onPressed: () => Navigator.pop(context),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Observer(
          builder: (context) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 24),
                child: Text(
                  'Modo ${getModo()}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeApp.color,
                  ),
                ),
              ),
              ...getRecordesList(
                modo == Modo.normal
                    ? repository.recordsNormal
                    : repository.recordsRound6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
