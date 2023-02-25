import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawsh_app/presentation/base/pages/base_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      // meta
      title: 'Pawsh App',

      // theme
      theme: CupertinoThemeData(primaryColor: CupertinoColors.black),

      // app entry
      home: BasePage(),

      // debug
      debugShowCheckedModeBanner: false,
    );
  }
}
