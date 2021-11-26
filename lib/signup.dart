// ignore_for_file: unused_element, non_constant_identifier_names, missing_return, unused_import, must_be_immutable

import 'package:bank_app_ihebbouhamed/dashboard.dart';
import 'package:flutter/material.dart';
import '/animation/FadeAnimation.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'login.dart';

final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _firstnameController = TextEditingController();
final _lastnameController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmpasswordController = TextEditingController();
final _carteNumController = TextEditingController();

final _professionChoosedController = TextEditingController();

var confirmPass;

String nameInputValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Ce champ est obligatoire';
  }
}

String cardLengthValidator(value) {
  if (value.length < 8 || value.isEmpty) {
    return 'Numéro incorrect';
  }
}

String emailInputValidator(value) {
  if (value.isEmpty ||
      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) return 'Forme du mail est invalide';
}

String passwordInputValidator(
    TextEditingController _passwordController, String value) {
  if (value != _passwordController.text) {
    return 'Password doesnt match';
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  String professionChoosed;
  List professionList = [
    "Banquier",
    "Docteur",
    "Ingénieur",
    "Technicien",
    "Enseignant"
  ];

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Création Du Compte",
                          style: TextStyle(
                            fontSize: 30,
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
                          "Saisissez vos informations . Toutes vos informations seront stockés d'une maniére chiffrée et sans risque de piratage.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                        1.2,
                        MakeInput('Votre Nom', false, nameInputValidator,
                            _firstnameController)),
                    FadeAnimation(
                        1.2,
                        MakeInput('Votre Prénom', false, nameInputValidator,
                            _lastnameController)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                            1.2,
                            Text(
                              "Votre date de naissance",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                        1.2,
                        TextField(
                          inputFormatters: [
                            MultiMaskedTextInputFormatter(
                                masks: ['xx.xx.xx', 'xx.xx.xxxx'],
                                separator: '.')
                          ],
                          style: TextStyle(color: Colors.white),
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 12),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple[800])),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.purple[800])),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.purple[800], width: 2.0),
                              ),
                              hintText: '20.02.99 or 20.02.1999'),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                      1.2,
                      MakeInput("Votre adresse mail", false,
                          emailInputValidator, _emailController),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1.2,
                          Text(
                            "Votre mot de passe",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                        1.2,
                        TextFormField(
                            obscureText: true,
                            validator: (String value) {
                              confirmPass = value;
                              if (value.isEmpty) {
                                return "Un mot de passe est obligatoire";
                              } else if (value.length < 8) {
                                return "Votre mot de passe doit contenir au moins 8 chiffres";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple[800])),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple[800])),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purple[800], width: 2.0),
                                )))),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1.2,
                          Text(
                            "Confirmer votre mot de passe ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                        1.2,
                        TextFormField(
                            obscureText: true,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "La confirmation du mot de passe est obligatoire";
                              } else if (value.length < 8) {
                                return "Votre mot de passe doit contenir au moins 8 chiffres";
                              } else if (value != confirmPass) {
                                return "Confirmation non identique";
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple[800])),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple[800])),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purple[800], width: 2.0),
                                )))),
                    SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                        1.2,
                        MakeInput('Tapez le numéro de votre carte VISA', false,
                            cardLengthValidator, _carteNumController)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1.2,
                          Text(
                            "Choissisez votre profession",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FadeAnimation(
                      1.2,
                      DropdownButtonFormField(
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        dropdownColor: Colors.black,
                        decoration: new InputDecoration(
                            //
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.purple[800])),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.purple[800])),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.purple[800], width: 2.0),
                            )),
                        value: professionChoosed,
                        onChanged: (newValue) {
                          setState(() {
                            professionChoosed = newValue;
                          });
                        },
                        items: professionList.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Inscription en cours')),
                            );
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardPage(
                                          _firstnameController.text,
                                          _lastnameController.text,
                                          _carteNumController.text,
                                          professionChoosed)));
                            });
                          }
                        },
                        color: Colors.purple[800],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Expanded(
                    child: FadeAnimation(
                      1.4,
                      Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    Text(
                      "    Ou    ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: FadeAnimation(
                      1.4,
                      Divider(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 20),
                FadeAnimation(
                  1.6,
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    color: Colors.purple[800],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Authentification",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MakeInput(label, obscureText, validator, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
            obscureText: obscureText,
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple[800])),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple[800])),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple[800], width: 2.0),
                )),
            validator: validator),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
