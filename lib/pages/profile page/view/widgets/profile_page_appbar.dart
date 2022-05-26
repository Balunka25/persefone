import 'package:flutter/material.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
              centerTitle: true,
              toolbarHeight: 170,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Stack(
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/images/logo_profile_page.png"),
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
                    ),
                  ),
                ],
              ),
            );
  }
}