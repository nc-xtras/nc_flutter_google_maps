import 'package:flutter/material.dart';

import 'app/_index.dart';

void main() async {
  //todo: uncomment line below to init repo.mock files

  await inits();

  await Mocks.instance.init();

  runApp(const App());
}
