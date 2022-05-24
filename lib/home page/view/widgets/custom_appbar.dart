import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 170,
        elevation: 0,
        backgroundColor: const Color(0xFF45674F),
        centerTitle: true,
        title: Container(
          height: 35,
          width: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/logo.gif"),
                fit: BoxFit.cover),
          ),
        ),
);
  }

  @override
  Size get preferredSize => const Size.fromHeight(170.0);
}
