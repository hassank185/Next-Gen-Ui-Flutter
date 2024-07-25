import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart'; // Add this import
import 'package:window_size/window_size.dart';

import 'assets.dart';
import 'features/title_screen/pages/title_screen.dart'; // Add this import

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowMinSize(const Size(800, 500));
  }
  Animate.restartOnHotReload = true;
  runApp(
    // Edit from here...
    FutureProvider<FragmentPrograms?>(
      create: (context) => loadFragmentPrograms(),
      initialData: null,
      child: const NextGenApp(),
    ),
  ); // to here.
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const TitleScreen(),
    );
  }
}
