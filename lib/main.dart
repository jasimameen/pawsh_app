import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawsh_app/presentation/base/pages/base_page.dart';
import 'package:pawsh_app/presentation/client_detail/pages/client_detail_page.dart';
import 'package:pawsh_app/presentation/contacts/pages/contacts_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), scaleByHeight: true);

    return MaterialApp(
      // meta
      title: 'Pawsh App',

      // theme
      theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black)),

      initialRoute: '/',
      routes: {
        '/': (context) => BasePage(),
        '/contacts': (context) => ContactsPage(),
        '/client-details': (context) => ClientDetailPage(),
      },

      // app entry
      builder: (context, child) => MediaQuery(
        data: MediaQueryData(textScaleFactor: ScreenUtil().textScaleFactor),
        child: child!,
      ),

      // debug
      debugShowCheckedModeBanner: false,
    );
  }
}
