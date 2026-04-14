import 'package:emirano_app/app_body.dart';
import 'package:flutter/material.dart';

class Emirano extends StatelessWidget {
  const Emirano({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBody(),
      theme: ThemeData.dark(),
    );
  }
}
