import 'package:flutter/material.dart';
import 'package:persefone/home%20page/view/home_page.dart';

import 'design/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
   MaterialApp(
          title: 'Show Analytic',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
  }

