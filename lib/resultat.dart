import 'package:bank_app_ihebbouhamed/main.dart';
import 'package:flutter/material.dart';
import 'animation/FadeAnimation.dart';

class resultatPage extends StatefulWidget {
  @override
  _resultatPageState createState() => _resultatPageState();
}

class _resultatPageState extends State<resultatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        /*elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          */
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          //height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Simulateur de Crédit",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Bienvenue a ce simulateur qui va vous aider à faire une simulation d'un emprunt à la banque .Veuillez remplir ces champs afin de voir si vous êtes éligible à ce crédit.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      )),
                ]),
              ]),
        ),
      ),
    );
  }
}
