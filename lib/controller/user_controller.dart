import 'package:flutter/material.dart';
import 'package:proj_login/database/user_database.dart';
import 'package:proj_login/model/user_model.dart';
import 'package:proj_login/userInterface/pages/login.dart';
import 'package:proj_login/userInterface/pages/telaSucesso.dart';

class UserController {
  UserDataBase userDataBase = UserDataBase();

  void cadastrarUsuario(BuildContext context, String nome, String senha) {
    userDataBase.users.add(User(name: nome, password: senha));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void login(BuildContext context, String nome, String senha) {
    var user = userDataBase.users.firstWhere((user) => user.name == nome && user.password == senha, orElse: () => User(name: '', password: ''));
    if (user.name.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaSucesso()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Usuário ou senha inválidos."),
        ),
      );
    }
  }
}