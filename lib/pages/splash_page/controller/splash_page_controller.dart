import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:persefone/pages/explore%20page/view/explore_page.dart';

import '../../login page/view/login_page.dart';
part 'splash_page_controller.g.dart';

class SplashPageController = _SplashPageControllerBase with _$SplashPageController;

abstract class _SplashPageControllerBase with Store {
  @action
  Future checkIfUserIsLoggedIn(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
   FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ExplorePage(),
            ),
          );
          return;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      },
    );
  }
}