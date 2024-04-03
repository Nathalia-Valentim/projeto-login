import 'package:flutter/material.dart';
import 'package:proj_login/controller/user_controller.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool _isChecked = false;
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _repitaSenhaController = TextEditingController();

  void _cadastrarUsuario(BuildContext context, String nome, String email, String senha) {
  if (_isChecked && senha == _repitaSenhaController.text && nome.isNotEmpty && senha.isNotEmpty) {
    UserController().cadastrarUsuario(context, nome, senha);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Por favor, aceite os termos e condições, verifique se as senhas coincidem e preencha todos os campos."),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  'Cadastre-se no Haki List!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold, 
                    color: Colors.black, 
                  ),
                ),
              ),
              SizedBox(height: 32), 
              Image.asset('/listacadastro.png', width: 225), 
              SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Usuário',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Senha',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _repitaSenhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Repita sua senha',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Text('Aceito os termos e condições.'),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _cadastrarUsuario(context, 'Nome', _senhaController.text);

                },
                child: const Text('Finalize seu cadastro'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
