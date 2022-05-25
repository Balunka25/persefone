import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persefone/core/widgets/dialog_box.dart';
import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/home%20page/view/home_page.dart';
import 'package:persefone/pages/login%20page/controller/login_controller.dart';

import '../../register page/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'lib/images/logo.gif',
                height: 200,
                width: 250,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Observer(builder: (_) {
                  return TextField(
                     style: const  TextStyle(color: MyColors.primaryyellow),
                    onChanged: _controller.changeEmail,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: MyColors.primarywhite, width: 2),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: MyColors.primarywhite, width: 2),
                        ),
                        labelStyle: Theme.of(context).textTheme.headline2),
                  );
                }),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Observer(builder: (_) {
                  return TextField(
                    style: const  TextStyle(color: MyColors.primaryyellow),
                    onChanged: _controller.changePassword,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: MyColors.primaryyellow, width: 2),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: MyColors.primarywhite, width: 2),
                        ),
                        labelStyle: Theme.of(context).textTheme.headline2),
                  );
                }),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 250,
                  ),
                  InkWell(
                    splashColor: MyColors.primaryyellow,
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
                    splashColor: MyColors.primaryyellow,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    ),
                    child: Text(
                      "Não possui uma conta?",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Observer(builder: (_) {
                return SizedBox(
                  width: 260,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_controller.areCredentialsValid) {
                        try {
                          await _controller.loginUser();
                          dialogBox(
                            context,
                            "SUCESSO",
                            "Logado!",
                            "OK",
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            ),
                          );
                        } catch (error) {
                          if (error == 'wrong-password') {
                            dialogBox(context, "ERRO:", "Senha incorreta!",
                                "OK", () => Navigator.pop(context));
                          } else if (error == 'user-not-found' ||
                              error == "invalid-email") {
                            dialogBox(context, "ERRO:", "Usuário inexistente!",
                                "OK", () => Navigator.pop(context));
                          } else {
                            dialogBox(context, "ERRO:", "Erro ao logar!", "OK",
                                () => Navigator.pop(context));
                          }
                        }
                      } else if (!_controller.isEmailValid) {
                        dialogBox(
                          context,
                          "ERRO:",
                          "E-mail não confere!",
                          "OK",
                          () => Navigator.pop(context),
                        );
                      } else if (!_controller.isPasswordValid) {
                        dialogBox(
                          context,
                          "ERRO:",
                          "Senha não confere!",
                          "OK",
                          () => Navigator.pop(context),
                        );
                      } else {
                        dialogBox(
                          context,
                          "ERRO:",
                          "Todos os campos devem ser preenchidos",
                          "OK",
                          () => Navigator.pop(context),
                        );
                      }
                    },
                    child: Text("Login",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 28)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyColors.primaryyellow),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
