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
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DrawerStyle(),
      child: Container(
        width: 500,
        height: 800,
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/images/leaves1.gif"),
                        fit: BoxFit.cover),
                    color: MyColors.primarygreen.withOpacity(0.5)),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView(
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
                    child: Stack(
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
                                  "lib/images/logo_favorite_page.png"),
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
                                .copyWith(color: Colors.black),
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
                              image: AssetImage("lib/images/explorar_icon.png"),
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
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListTile(
                    // leading: const Icon(
                    //   Icons.logout,
                    //   color: MyColors.primarydark,
                    //   size: 15,
                    // ),
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
