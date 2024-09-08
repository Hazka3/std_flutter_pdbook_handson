import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterHandson());
}

class FlutterHandson extends StatelessWidget {
  const FlutterHandson({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}
