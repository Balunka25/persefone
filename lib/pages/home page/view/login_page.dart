import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persefone/design/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Image.asset('lib/images/logo.gif',
                height: 200,
                width: 250,),
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
            Row(
              children: [
                const SizedBox(
                  width: 250,
                ),
                InkWell(
                  splashColor: MyColors.primarywhite,
                  onTap: () {},
                  child: Text(
                    "Alterar Senha",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                InkWell(
                  splashColor: MyColors.primarywhite,
                  onTap: () {},
                  child: Text(
                    "Não possui uma conta?",
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            SizedBox(
              width: 260,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 28)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(MyColors.primaryyellow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
