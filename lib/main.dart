import 'package:flutter/material.dart';

import 'core/redux/store.dart';
import 'my_app.dart';

void main() async {
  await Redux.init();

  runApp(MyApp());
}
