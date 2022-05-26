import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/home%20page/view/home_page.dart';
import 'package:persefone/pages/login%20page/view/login_page.dart';
import 'package:persefone/pages/register%20page/controller/register_controller.dart';
import 'package:persefone/core/widgets/dialog_box.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _controller = RegisterController();

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
                'lib/images/logo.png',
                height: 200,
                width: 250,
              ),
              Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 40, bottom: 20),
                  child: Observer(builder: (_) {
                    return TextField(
                      style: const TextStyle(color: MyColors.primaryyellow),
                      onChanged: _controller.changeName,
                      decoration: InputDecoration(
                          labelText: ' Nome',
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
                      style: const TextStyle(color: MyColors.primaryyellow),
                      onChanged: _controller.changeEmail,
                      decoration: InputDecoration(
                          labelText: 'Email',
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
              const SizedBox(
                height: 25,
              ),
              Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 40, bottom: 20),
                  child: Observer(builder: (_) {
                    return TextField(
                      style: const TextStyle(color: MyColors.primaryyellow),
                      obscureText: !_controller.isPasswordVisible,
                      onChanged: _controller.changePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _controller.isPasswordVisible
                                  ? const Icon(
                                      Icons.visibility,
                                      color: MyColors.primarywhite,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: MyColors.primarywhite,
                                    ),
                              onPressed: _controller.setPasswordVisibility),
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
                  })),
              const SizedBox(
                height: 25,
              ),
              Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 40, bottom: 20),
                  child: Observer(builder: (_) {
                    return TextField(
                      style: const TextStyle(color: MyColors.primaryyellow),
                      obscureText: !_controller.isPasswordConfirmationVisible,
                      onChanged: _controller.changePasswordConfirmation,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _controller.isPasswordConfirmationVisible
                                  ? const Icon(Icons.visibility,color: MyColors.primarywhite,)
                                  : const Icon(Icons.visibility_off,color: MyColors.primarywhite,),
                              onPressed: _controller
                                  .setPasswordConfirmationVisibility),
                          labelText: 'Confirmar senha',
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.primarywhite, width: 2),
                          ),
                          labelStyle: Theme.of(context).textTheme.headline2),
                    );
                  })),
              SizedBox(
                width: 260,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_controller.areCredentialsValid) {
                      await _controller.registerUser();
                      dialogBox(
                        context,
                        "SUCESSO",
                        "Usuário criado!",
                        "OK",
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        ),
                      );
                    } else if (!_controller.isPasswordValid) {
                      dialogBox(
                        context,
                        "ERRO:",
                        "Senha não confere!",
                        "OK",
                        () => Navigator.pop(context),
                      );
                    } else if (!_controller.isEmailValid) {
                      dialogBox(
                        context,
                        "ERRO:",
                        "E-mail não confere!",
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
                  child: Text("Registrar",
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
