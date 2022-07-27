import 'dart:async';

import 'package:elred/di/get_it.dart' as get_it;
import 'package:elred/todo_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  unawaited(
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(get_it.init());

  runApp(const TodoApp());
}
