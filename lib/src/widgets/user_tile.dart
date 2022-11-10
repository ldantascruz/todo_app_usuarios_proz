
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/src/model/user_model.dart';

class UserTile extends StatelessWidget {
  final AsyncSnapshot<List<UserModel>> snapshot;
  final int index;

  const UserTile({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromARGB(255, 134, 133, 133),
      onTap: () {
        log("${snapshot.data![index]}");
      },
      child: Card(
        elevation: 5,
        color: const Color.fromARGB(255, 211, 211, 211),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome:  ${snapshot.data![index].name}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Idade:  ${snapshot.data![index].age}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "E-mail:  ${snapshot.data![index].email}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Sexo:  ${snapshot.data![index].gender}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
