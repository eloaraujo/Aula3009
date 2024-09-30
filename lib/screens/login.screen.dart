import 'package:aula3009/screens/controller/login.controller.dart';
import 'package:aula3009/snippets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController; //"_" declara a variavel como privada
  late TextEditingController _passwordController;
  late LoginController _loginController;

  @override
  void initState() {
    _loginController = LoginController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  _onPressed() {
    _loginController.save(
        _emailController.text,
        _passwordController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //alinhamneto horizontal
        crossAxisAlignment: CrossAxisAlignment.center, //alinhamento vertical
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20), //
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20, //tamanho fonte da palavra login (fontSize)
                fontWeight: FontWeight.bold, //bold (negrito)
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: inputDecoration(label: "Informe o e-mail"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: _passwordController,
              decoration: inputDecoration(label: "Informe o password"),
            ),
          ),
          ElevatedButton(onPressed: _onPressed, child: const Text("Entrar")),
          Row(
            children: [
              Text("Não tem conta? "),
              InkWell( //interagir com o usuario
                  onTap: (){},
                  child: const Text(
                    "Cadastre aqui",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
