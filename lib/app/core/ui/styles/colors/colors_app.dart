import 'package:flutter/material.dart';

class ColorsApp {
  ColorsApp._();
  static ColorsApp? _instance;

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }
  
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colorsApp => ColorsApp.instance;
}
