import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'package:todo_app/src/repository/user_repository.dart';
import 'package:todo_app/src/controller/user_controller.dart';
import 'package:todo_app/src/model/user_model.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({
    super.key,
  });
  @override
  State<CreateUserPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CreateUserPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();

  final createUserController = UserController(UserRepository());

  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuário'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    labelText: 'Nome',
                  ),
                  onChanged: ((_) => log(nameController.text)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    labelText: 'Idade',
                  ),
                  onChanged: ((_) => log(ageController.text)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    labelText: 'E-mail',
                  ),
                  onChanged: ((_) => log(emailController.text)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: genderController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    labelText: 'Sexo',
                  ),
                  onChanged: ((_) => log(genderController.text)),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    log('Botão pressionado');

                    createUserController
                        .createUser(
                          UserModel(
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            email: emailController.text,
                            gender: genderController.text,
                          ),
                        )
                        .then((value) => Navigator.of(context)
                            .popAndPushNamed('/list_users'));
                  },
                  child: const Text(
                    'Publicar',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ATUALIZANDO A COR DA STATUSBAR PARA SER A MESMA DA APPBAR
_setStatusbarColor() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
}
