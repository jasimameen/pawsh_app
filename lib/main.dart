import 'package:flutter/cupertino.dart';
import 'package:pawsh_app/features/base/presentation/pages/base_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      // meta
      title: 'Pawsh App',

      // app entry
      home: BasePage(),

      // debug
      debugShowCheckedModeBanner: false,
    );
  }
}
