import 'package:flutter/material.dart';
import 'package:todo_app/src/view/create_user_page.dart';
import 'package:todo_app/src/view/list_users_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: '/list_users',
        routes: {
          "/list_users": (context) => const ListUsersPage(),
          "/create_user": (context) => const CreateUserPage(),
        });
  }
}
