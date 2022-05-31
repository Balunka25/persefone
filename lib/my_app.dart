import 'package:flutter/material.dart';
import 'package:persefone/pages/splash_page/view/splash_page.dart';

import 'design/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
   MaterialApp(
          title: 'Show Analytic',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        );
  }

