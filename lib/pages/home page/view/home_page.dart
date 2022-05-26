import 'package:flutter/material.dart';
import 'package:persefone/core/widgets/stylish_drawer.dart';
import 'package:persefone/pages/home%20page/view/widgets/custom_appbar.dart';

import '../../explore page/view/explore_page.dart';
import '../../profile page/view/profile_page.dart';
import 'widgets/custom_appbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/backgroud.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        drawer: const StylishDrawer(),
          backgroundColor: Colors.transparent,
          appBar: CustomAppbar(),
          body: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const ExplorePage())));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/images/planta_explorar.png"),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 130,
                            left: 53,
                            child: Text("Explorar",
                                style: Theme.of(context).textTheme.headline4))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                    onTap: (){
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
                              image:
                                  AssetImage("lib/images/logo_profile_page.png"),
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
                    onTap: (){
                      
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/images/logo_favorite_page.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          right: 40,
                            child: Text(
                          "Favoritos",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.black),
                        ))
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
