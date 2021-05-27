import 'package:body_mind/components/components.dart';
import 'package:body_mind/components/constants.dart';
import 'package:body_mind/model/user_auth.dart';
import 'package:body_mind/screens/home_screen.dart';
import 'package:body_mind/screens/signup_screen.dart';
import 'package:body_mind/service/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Consumer<UserAuth>(
          builder: (_, userAuth, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Image.asset('images/2517894.jpg'),
                ),
                MyTextField(
                  prefix: Icons.person,
                  obscure: false,
                  hint: 'John Doe',
                  label: 'Nome',
                  v: (name) {
                    if (name.isEmpty) {
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                ),
                MyTextField(
                  prefix: Icons.person,
                  obscure: false,
                  hint: 'user@user.com',
                  label: 'Email',
                  v: (email) {
                    if (email.isEmpty) {
                      return 'Digite seu email';
                    }
                    return null;
                  },
                ),
                MyTextField(
                  prefix: Icons.lock,
                  obscure: true,
                  suffix: Icons.visibility,
                  hint: '123456',
                  label: 'Senha',
                  v: (password) {
                    if (password.isEmpty) {
                      return 'Digite a senha';
                    }
                    return null;
                  },
                ),
                LoginButton(
                  onTap: () {
                    /* auth.signInWithEmailAndPassword(
                    email: _email, password: _password);

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen())); */
                  },
                  title: 'Signup',
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Já possui uma conta? \nEntre agora!',
                      textAlign: TextAlign.center,
                      style: kAccountText,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
