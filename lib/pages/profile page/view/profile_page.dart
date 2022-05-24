import 'dart:io';

import 'package:flutter/material.dart';

import '../../upload image/view/upload_image_page.dart';

class ProfilePage extends StatefulWidget with PreferredSizeWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  Size get preferredSize => const Size.fromHeight(170.0);
}

File? image;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/backgroud.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
                  ))
            ],
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 40),
            Text(
              "Minhas Plantas",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black),
            ),
            IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                  color: Colors.green[700],
                ),
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const UploadImagePage())));
                }),
          ],
        ),
      ),
    );
  }
}
