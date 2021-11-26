// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'animation/FadeAnimation.dart';

class ConvertDevise extends StatefulWidget {
  @override
  _ConvertDeviseState createState() => _ConvertDeviseState();
}

final montant = TextEditingController()..text = '0';
final _formKey = GlobalKey<FormState>();

double convertEuro(montant) {
  double convtEur = (double.parse(montant.text) / 3.2);
  return convtEur;
}

double convertDollar(montant) {
  double convtEur = (double.parse(montant.text) / 2.8);
  return convtEur;
}

double convertLivre(montant) {
  double convtEur = (double.parse(montant.text) / 3.8);
  return convtEur;
}

double convertedtoEUR = (double.parse(montant.text) / 3);
double convertedtoUSD = (double.parse(montant.text) / 2.8);
double convertedtoLST = (double.parse(montant.text) / 3.8);

class _ConvertDeviseState extends State<ConvertDevise> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                                "Cet outil permet de convertir votre montant de Dinar Tunisien vers Euro , Dollar Américain  et Livre Sterling",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              )),
                        ]),
                        Column(children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                1.2,
                                Text(
                                  "Montant à convertir",
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
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ce champ est obligatoire';
                                  } else {
                                    if (double.parse(value) < 0) {
                                      return 'Ce champ est obligatoire';
                                    }
                                  }
                                },
                                controller: montant,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Votre Montant en Dinar Tunisien",
                                    hintStyle: TextStyle(
                                        fontSize: 15.0, color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 12),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purple[800])),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purple[800])),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.purple[800],
                                          width: 2.0),
                                    ))),
                          ),
                          SizedBox(
                            height: 25,
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
                                    if (_formKey.currentState.validate()) {
                                      convertedtoEUR = convertEuro(montant);
                                      convertedtoUSD = convertEuro(montant);
                                      convertedtoLST = convertEuro(montant);
                                      setState(() => convertedtoEUR =
                                          convertEuro(montant));
                                      setState(() => convertedtoUSD =
                                          convertDollar(montant));
                                      setState(() => convertedtoLST =
                                          convertLivre(montant));
                                    }
                                  },
                                  color: Colors.purple[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "Convertir",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ),
                              )),
                          FadeAnimation(1.2, Image.asset("assets/down.png")),
                          FadeAnimation(
                            1.2,
                            Text(
                              "${double.parse(montant.text)}" +
                                  "DT = ${convertedtoEUR.toStringAsFixed(2)}" +
                                  " €",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          FadeAnimation(
                            1.2,
                            Text(
                              "${double.parse(montant.text)}" +
                                  "DT = ${convertedtoUSD.toStringAsFixed(2)}" +
                                  " \$",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          FadeAnimation(
                            1.2,
                            Text(
                              "${double.parse(montant.text)}" +
                                  "DT = ${convertedtoLST.toStringAsFixed(2)}" +
                                  " £",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          )
                        ])
                      ]))),
        ));
  }
}
