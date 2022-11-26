import 'package:flutter/material.dart';

import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'package:todo_app/src/controller/user_controller.dart';
import 'package:todo_app/src/repository/user_repository.dart';
import 'package:todo_app/src/widgets/user_tile.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({super.key});

  @override
  State<ListUsersPage> createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    final userController = UserController(UserRepository());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: userController.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    UserTile(
                      index: index,
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Aguarde um instante...',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Você não possui usuários cadastrados! \n Clique no botão "Adicionar" para inserir usuários a lists',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else {
            return const SizedBox(
              child: Text('caiu aquiscacscacscasasasasca'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Adicionar Usuário'),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/create_user');
        },
      ),
      
    );
  }
}

// ATUALIZANDO A COR DA STATUSBAR PARA SER A MESMA DA APPBAR
_setStatusbarColor() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
}
