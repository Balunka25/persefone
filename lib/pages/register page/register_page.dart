import 'package:flutter/material.dart';

import 'package:persefone/design/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/background_register_page.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'lib/images/logo.gif',
              height: 200,
              width: 250,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 40, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: ' Nome',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.primarywhite, width: 2),
                    ),
                    labelStyle: Theme.of(context).textTheme.headline2),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 40, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.primarywhite, width: 2),
                    ),
                    labelStyle: Theme.of(context).textTheme.headline2),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 40, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Senha',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.primarywhite, width: 2),
                    ),
                    labelStyle: Theme.of(context).textTheme.headline2),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 40, bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MyColors.primarywhite, width: 2),
                    ),
                    labelStyle: Theme.of(context).textTheme.headline2),
              ),
            ),
            // 
            InkWell(
              splashColor: MyColors.primarywhite,
              onTap: () {},
              child: Text(
                "OK",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
