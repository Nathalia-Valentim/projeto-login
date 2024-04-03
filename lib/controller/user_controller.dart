import 'package:flutter/material.dart';
import 'package:proj_login/database/user_database.dart';
import 'package:proj_login/model/user_model.dart';
import 'package:proj_login/userInterface/pages/telaSucesso.dart';

class UserController {
  //Criamos o objeto Database para termos acesso a lista que fizemos nele
  UserDataBase userDataBase = UserDataBase();

  login(context, String nome, String senha) {
    var user = userDataBase.users; //passa os valores que estão na lista de usuários para a variável lista
    var result =
        user.where((item) => item.name == nome);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const TelaTarefas()), (route) => false);
  }

  cadastro(context, String nome, String senha) {
    var newUser = User(name: nome, password: senha);
    userDataBase.users.add(newUser);
    print(userDataBase.users);
  }
}