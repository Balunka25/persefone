import 'package:flutter/material.dart';
import 'package:persefone/pages/changepass%20page/changepass_page.dart';
import 'package:persefone/pages/login%20page/view/login_page.dart';
import 'package:persefone/pages/register%20page/view/register_page.dart';

import 'design/theme.dart';
import 'pages/home page/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
   MaterialApp(
          title: 'Show Analytic',
          theme: theme(),
          debugShowCheckedModeBanner: false,
          home: const ChangePassPage(),
        );
  }

