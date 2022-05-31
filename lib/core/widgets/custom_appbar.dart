import 'package:flutter/material.dart';
import 'package:persefone/design/my_colors.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: MyColors.primaryyellow,
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
        backgroundColor: MyColors.primarygreen,
        elevation: 0,
        centerTitle: true,
       
        title: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(
              'lib/images/perse.png',
              height: 130,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}
