import 'package:body_mind/components/components.dart';
import 'package:body_mind/components/constants.dart';
import 'package:body_mind/model/user.dart';
import 'package:body_mind/model/user_auth.dart';
import 'package:body_mind/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserData user = UserData();

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
                  onSaved: (name) => user.name = name,
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
                  onSaved: (email) => user.email = email,
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
                  onSaved: (password) => user.password = password,
                ),
                LoginButton(
                  onTap: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                    }
                    userAuth.signUp(
                        userData: user,
                        onSuccess: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        onFail: (e) {
                          print('Ocorreu um erro $e');
                        });
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
