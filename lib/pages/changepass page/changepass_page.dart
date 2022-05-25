import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:persefone/design/my_colors.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  // final _controller = ChangePassController();

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
              const SizedBox(height: 100,),
              Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 40, bottom: 20),
                  child: Observer(builder: (_) {
                    return TextField(
                      style: const TextStyle(color: MyColors.primaryyellow),
                      // onChanged: _controller.changeName,
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
                  onPressed: () {},
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
