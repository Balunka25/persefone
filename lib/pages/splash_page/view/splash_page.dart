import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../controller/splash_page_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


final _controller = SplashPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF38c172),
      body: Center(
        child: Observer(builder: (_) {
          _controller.checkIfUserIsLoggedIn(context);
          return Center(
            child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_juote5w5.json"),
          );
        }),
      ),
    );
}
}
