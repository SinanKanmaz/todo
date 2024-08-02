import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/flavors.dart';
import 'app.dart';
import 'firebase_options_dev.dart' as dev;

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (F.appFlavor == Flavor.dev) {
    await Firebase.initializeApp(
        options: dev.DefaultFirebaseOptions.currentPlatform);
  }

  runApp(const ProviderScope(child: App()));
}
