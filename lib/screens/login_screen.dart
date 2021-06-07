import 'package:body_mind/components/components.dart';
import 'package:body_mind/components/constants.dart';
import 'package:body_mind/model/user.dart';
import 'package:body_mind/model/user_auth.dart';
import 'package:body_mind/screens/home_screen.dart';
import 'package:body_mind/screens/signup_screen.dart';
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
                  prefix: Icons.email,
                  obscure: false,
                  hint: 'user@user.com',
                  label: 'Email',
                  c: emailController,
                ),
                MyTextField(
                  prefix: Icons.lock,
                  obscure: true,
                  suffix: Icons.visibility,
                  hint: '123456',
                  label: 'Senha',
                  c: passwordController,
                ),
                LoginButton(
                  onTap: () {
                    if (formKey.currentState.validate()) {
                      userAuth.singIn(
                          userData: UserData(
                              email: emailController.text,
                              password: passwordController.text),
                          onFail: (e) {
                            print('Error');
                          },
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          });
                    }
                  },
                  title: 'Login',
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Ainda não possui uma conta? \nCadastre-se agora!',
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
