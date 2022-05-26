import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/changepass%20page/view/changepass_page.dart';
import 'package:persefone/pages/home%20page/view/home_page.dart';
import 'package:persefone/pages/login%20page/view/login_page.dart';
import 'package:persefone/pages/profile%20page/view/profile_page.dart';

class StylishDrawer extends StatefulWidget {
  const StylishDrawer({Key? key}) : super(key: key);

  @override
  State<StylishDrawer> createState() => _StylishDrawerState();
}

class _StylishDrawerState extends State<StylishDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DrawerStyle(),
      child: Container(
        width: 300,
        height: 700,
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 247, 255)
                        .withOpacity(0.5)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: ListView(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ProfilePage())));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/images/logo_profile_page.png"),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 150,
                            left: 65,
                            child: Text(
                              "Perfil",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomePage())));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/images/logo_favorite_page.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          right: 150,
                          child: Text(
                            "Favoritos",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ChangePassPage())));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/images/explorar_icon.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          right: 120,
                          child: Text(
                            "Mudar Senha",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: MyColors.primarydark,
                      size: 15,
                    ),
                    title: const Text("Sair",
                        style: TextStyle(
                            color: MyColors.primarydark, fontSize: 10)),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerStyle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        size.width - 50, size.height - 80, size.width, size.height);
    path.quadraticBezierTo(size.width - 100, size.height / 2, size.width, 0);
    path.quadraticBezierTo(size.width / 2, 30, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
