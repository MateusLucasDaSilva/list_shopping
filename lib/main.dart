import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/presentation/pages/my_lists/my_lists_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Defaulcloud_firestoretFirebaseOptions.currentPlatform);
  runApp(const MyApp());s
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nosso Sonho',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff4E818F),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        useMaterial3: true,
      ),
      home: const MyListsPage(),
    );
  }
}
