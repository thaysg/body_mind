import 'package:body_mind/components/components.dart';
import 'package:body_mind/model/user_auth.dart';
import 'package:body_mind/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Consumer<UserAuth>(
            builder: (_, userAuth, __) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        Text('Body & Mind'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Olá ${userAuth.user?.name ?? ''} ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        userAuth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          BodyHome(),
        ],
      ),
    );
  }
}
