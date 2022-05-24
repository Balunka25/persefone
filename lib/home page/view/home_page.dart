import 'package:flutter/material.dart';
import 'package:persefone/home%20page/view/widgets/custom_appbar.dart';

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
        backgroundColor: Colors.transparent,
        appBar: CustomAppbar(),
          body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/planta_explorar.png"),
                      ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/logo_profile_page.png"),
                      ),
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/logo_favorite_page.png"),
                      ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
