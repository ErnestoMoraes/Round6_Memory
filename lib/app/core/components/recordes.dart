import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/app/contrains.dart';
import 'package:jogo_da_memoria/app/core/ui/styles/themeApp/theme_app.dart';
import 'package:jogo_da_memoria/app/page/recordes/recordes_page.dart';

class Recordes extends StatefulWidget {
  const Recordes({super.key});

  @override
  State<Recordes> createState() => _RecordesState();
}

class _RecordesState extends State<Recordes> {
  showRecordes(Modo modo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordesPage(modo: modo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Recordes',
                style: TextStyle(color: ThemeApp.color, fontSize: 22),
              ),
            ),
            ListTile(
              title: const Text(
                'Modo Normal',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.normal),
            ),
            ListTile(
              title: const Text(
                'Modo Round 6',
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showRecordes(Modo.round6),
            ),
          ],
        ),
      ),
    );
  }
}
