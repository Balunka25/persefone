import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/changepass%20page/view/changepass_page.dart';
import 'package:persefone/pages/favorite%20page/view/favorite_page.dart';
import 'package:persefone/pages/login%20page/view/login_page.dart';
import 'package:persefone/pages/profile%20page/view/profile_page.dart';

class StylishDrawer extends StatefulWidget {
  const StylishDrawer({Key? key}) : super(key: key);

  @override
  State<StylishDrawer> createState() => _StylishDrawerState();
}

class _StylishDrawerState extends State<StylishDrawer> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DrawerStyle(),
      child: SizedBox(
        width: 500,
        height: 800,
        child: Stack(
          children: <Widget>[
            // BackdropFilter(
              // filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
               Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("lib/images/fallingleave.gif"),
                        fit: BoxFit.cover),
                    color: MyColors.primarygreen.withOpacity(0.5)),
              ),
            // ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ProfilePage())));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/images/logo_profile_page.png"),
                            ),
                          ),
                        ),
                        Text(
                          "Perfil",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.orangeAccent),
                        )
                      ],
                    ),
                  ),
                  // const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const FavoritePage())));
                    },
                    child: Stack(
                      children: [
                        Container(
                          //  padding: const EdgeInsets.only(right:64),
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/images/heart.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 140,
                          left: 65,
                          child: Text(
                            "Favoritos",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.orangeAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
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
                              image: AssetImage("lib/images/change_icon.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          left: 30,
                          child: Text(
                            "Mudar Senha",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.orangeAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Row(
                      children: [
                        InkWell(
                          child: const Text(
                            "Sair",
                            style: TextStyle(
                                color: MyColors.primarydark, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Stack(children: <Widget>[
                  // SizedBox(
                  //   height: 100,
                  //   width: 100,
                  //   child: AnimatedPositioned(
                  //     width: selected ? 200.0 : 50.0,
                  //     height: selected ? 50.0 : 200.0,
                  //     top: selected ? 50.0 : 150.0,
                  //     duration: const Duration(seconds: 2),
                  //     curve: Curves.fastOutSlowIn,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           selected = !selected;
                  //         });
                  //       },
                  //       child: Container(
                  //         height: 100,
                  //         width: 100,
                  //         color: Colors.blue,
                  //         child: const Center(child: Text('Tap me')),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // ],
                  // ),
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
    Path path0 = Path();
    path0.moveTo(size.width * 0.0050000, size.height * 0.9925690);
    path0.quadraticBezierTo(size.width * 0.6735167, size.height * 0.8018843,
        size.width * 0.6109833, size.height * 0.4071789);
    path0.cubicTo(
        size.width * 0.6268667,
        size.height * 0.3555600,
        size.width * 0.4626833,
        size.height * 0.1088509,
        size.width * 0.4132500,
        size.height * 0.0094082);
    path0.quadraticBezierTo(size.width * 0.2423833, size.height * 0.1355892,
        size.width * 0.0050000, size.height * 0.1963907);
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
