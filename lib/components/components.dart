import 'package:body_mind/components/constants.dart';
import 'package:body_mind/screens/exercises/agachamento.dart';
import 'package:body_mind/screens/exercises/prancha_screen.dart';
import 'package:body_mind/screens/exercises/yoga_screen.dart';
import 'package:body_mind/screens/meditation_screen.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color colour;
  final AssetImage picture;
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  const MyContainer(
      {this.colour, this.picture, this.onTap, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        height: 100,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kTextStyleTitle,
                  ),
                  Spacer(),
                  Text(
                    subtitle,
                    style: kTextStyleSubtitle,
                  ),
                ],
              ),
            ),
            Image(
              image: picture,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyContainer(
          colour: Colors.indigo[200],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MeditationScreen(),
              ),
            );
          },
          title: 'ABS',
          subtitle: '3 Exercíos 3 Mins',
          picture: AssetImage(
            'images/crunch.png',
          ),
        ),
        MyContainer(
          colour: Colors.cyan[200],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrachaScreen(),
              ),
            );
          },
          title: 'Prancha',
          subtitle: '3 Exercíos 3 Mins',
          picture: AssetImage(
            'images/pushup.png',
          ),
        ),
        MyContainer(
          colour: Colors.blue[200],
          onTap: () {},
          title: 'Bicicleta',
          subtitle: '5 Exercíos 5 Mins',
          picture: AssetImage(
            'images/workout1.png',
          ),
        ),
        MyContainer(
          colour: Colors.red[200],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AgachamentoScreen(),
              ),
            );
          },
          title: 'Agachamento',
          subtitle: '3 Exercíos 3 Mins',
          picture: AssetImage(
            'images/workout2.png',
          ),
        ),
        MyContainer(
          colour: Colors.orange[200],
          onTap: () {},
          title: 'Alongamento',
          subtitle: '8 Exercíos 8 Mins',
          picture: AssetImage(
            'images/workout3.png',
          ),
        ),
        MyContainer(
          colour: Colors.green[200],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YogaScreen(),
              ),
            );
          },
          title: 'Yoga',
          subtitle: '7 Exercíos 7 Mins',
          picture: AssetImage(
            'images/yoga.png',
          ),
        ),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  final String label;
  final IconData suffix;
  final IconData prefix;
  final String hint;
  final TextEditingController c;
  final Function f;
  final bool obscure;
  final Function v;
  final Function onSaved;

  const MyTextField({
    Key key,
    this.label,
    this.suffix,
    this.hint,
    this.c,
    this.f,
    this.obscure,
    this.prefix,
    this.v,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          validator: v,
          controller: c,
          onChanged: f,
          onSaved: onSaved,
          obscureText: obscure,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            suffixIcon: Icon(suffix),
            prefixIcon: Icon(prefix),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const LoginButton({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              title,
              style: kTextStyleTitle,
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const MyButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width * .90,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
