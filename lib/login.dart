import 'package:flutter/material.dart';
import 'calendar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // -------- Validar e-mail com regex --------
  bool validarEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // -------- Validar senha --------
  bool validarSenha(String senha) {
    return senha.length >= 6;
  }

  void fazerLogin() {
    final email = _emailController.text;
    final senha = _passwordController.text;

    if (!validarEmail(email)) {
      mostrarErro("E-mail inválido");
      return;
    }

    if (!validarSenha(senha)) {
      mostrarErro("A senha deve ter no mínimo 6 caracteres");
      return;
    }

    // -------- Se tudo OK, abre o calendário --------
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => CalendarPage()),
    );
  }

  // -------- Mostrar snackbar bonito --------
  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // volta para TelaInicial
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "E-mail"),
            ),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: fazerLogin,
              child: Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
