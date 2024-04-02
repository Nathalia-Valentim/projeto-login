// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:proj_login/database/user_database.dart';
import 'package:proj_login/userInterface/pages/telaSucesso.dart';

class UserController {
  //Criamos o objeto Database para termos acesso a lista que fizemos nele
  UserDataBase userDataBase = UserDataBase();

  login(context, String nome, String senha) {
    var user = userDataBase
        .users; //passa os valores que estão na lista de usuários para a variável lista
    var result =
        user.where((item) => item.name == nome && item.password == senha);

    if (result.isNotEmpty) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => TelaSucesso()), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Senha inválida"),
      ));
    }
  }
}
