import 'package:flutter/material.dart';
import 'package:proj_login/controller/user_controller.dart';
import 'package:proj_login/userInterface/pages/cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserController userController = UserController();

  final nomeController = TextEditingController();
  final passwordController = TextEditingController();

  void _loginUsuario(BuildContext context, String email, String senha) {
  UserController().login(context, email, senha);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bem-vindo ao Haki List!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                Image.asset('/fundo_tela-login.png', width: 225),
                const SizedBox(height: 32),
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    hintText: 'Usuário',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (passwordController.text.isNotEmpty) {
                      _loginUsuario(context, nomeController.text, passwordController.text);
                    } else {
                      _cadastrarUsuario(context, nomeController.text, passwordController.text);
                    }
                  },
                  child: Text(passwordController.text.isNotEmpty ? 'Login' : 'Entrar'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TelaCadastro()),
                    );
                  },
                  child: const Text(
                    'Não tem conta? Cadastre-se',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 32),
                const Text('Ou entre com'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('/apple_logo.png', width: 38),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('/gmail-icon.png', width: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('/outlook-icon-png.png', width: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _cadastrarUsuario(BuildContext context, String nome, String senha) {
    // TODO: Implementar a lógica de cadastro de usuário
  }
}