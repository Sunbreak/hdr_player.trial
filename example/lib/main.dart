import 'package:flutter/material.dart';

import 'package:hdr_player/hdr_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: HdrPlayer(),
          ),
        ),
      ),
    );
  }
}
