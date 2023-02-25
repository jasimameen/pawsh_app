import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawsh_app/presentation/base/pages/base_page.dart';
import 'package:pawsh_app/presentation/client_detail/pages/client_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // meta
      title: 'Pawsh App',

      // theme
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.black,
      ),

      // app entry
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(375, 812));

        return const BasePage();
      },

      // debug
      debugShowCheckedModeBanner: false,
    );
  }
}
