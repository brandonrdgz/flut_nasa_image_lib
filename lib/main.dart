import 'package:flut_nasa_image_lib/pages/images/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  late final ThemeData _themeData;

  MyApp({super.key}) {
    _themeData = ThemeData.dark(
      useMaterial3: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nasa Image Library App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 13, 61, 144),
        brightness: Brightness.dark,
      ),
      home: const ImagesPage(),
    );
  }
}

