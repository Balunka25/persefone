import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/changepass%20page/controller/changepass_controller.dart';
import 'package:persefone/pages/login%20page/view/login_page.dart';

import '../../../core/widgets/dialog_box.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  final _controller = ChangePassController();

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
                'lib/images/perse.png',
                height: 200,
                width: 250,
              ),
              const SizedBox(height: 100,),
              Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 40, bottom: 20),
                  child: Observer(builder: (_) {
                    return TextField(
                      style: const TextStyle(color: MyColors.primaryyellow),
                      onChanged: _controller.changePassword,
                      decoration: InputDecoration(
                          labelText: 'Nova Senha',
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
                  })),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 40, bottom: 20),
                child: Observer(
                  builder: (_) {
                    return TextField(
                      onChanged: _controller.changeConfirmPassword,
                      style: const TextStyle(color: MyColors.primaryyellow),
                      // onChanged: _controller.changeEmail,
                      decoration: InputDecoration(
                          labelText: 'Confirme Nova Senha',
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
                  },
                ),
              ),
              const SizedBox(height: 60,),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                   onPressed: () async {
                      if (_controller.areCredentialsValid) {
                        try {
                          await _controller.resetPassword();
                          dialogBox(
                            context,
                            "SUCESSO",
                            "Atualizado!",
                            "OK",
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            ),
                          );
                        } catch (error) {
                          if (error == 'weak-password') {
                            dialogBox(context, "ERRO:", "Senha fraca!",
                                "OK", () => Navigator.pop(context));
                          }else {
                            dialogBox(context, "ERRO:", "Erro ao resetar senha!", "OK",
                                () => Navigator.pop(context));
                          }
                        }
                      } else if (!_controller.isPasswordConfirmationValid) {
                        dialogBox(
                          context,
                          "ERRO:",
                          "Senhas não conferem!",
                          "OK",
                          () => Navigator.pop(context),
                        );
                      } else if (!_controller.isPasswordValid) {
                        dialogBox(
                          context,
                          "ERRO:",
                          "Senha fraca!",
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
                  child: Text("Confirmar",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 28)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MyColors.primaryyellow),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
