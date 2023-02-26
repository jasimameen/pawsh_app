import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injection.dart';
import 'presentation/base/pages/base_page.dart';
import 'presentation/contacts/bloc/contact_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812), scaleByHeight: true);

    return BlocProvider(
      create: (context) => sl<ContactBloc>(),
      child: MaterialApp(
        // meta
        title: 'Pawsh App',

        // theme
        theme: ThemeData(
            primaryColor: Colors.black,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            iconTheme:
                Theme.of(context).iconTheme.copyWith(color: Colors.black)),

        initialRoute: '/',
        routes: {
          '/': (context) => const BasePage(),
        },

        // app entry
        builder: (context, child) => MediaQuery(
          data: MediaQueryData(textScaleFactor: ScreenUtil().textScaleFactor),
          child: child!,
        ),

        // debug
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
