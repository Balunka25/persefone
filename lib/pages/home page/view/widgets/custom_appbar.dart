import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          toolbarHeight: 150,
          backgroundColor: const Color(0xFF45674F),
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'lib/images/logo.gif',
                height: 280,
                width: 300,
              ),
            ],
          ),
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}

