// ignore_for_file: missing_return, camel_case_types

import 'package:bank_app_ihebbouhamed/succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'animation/FadeAnimation.dart';

class creditPage extends StatefulWidget {
  @override
  _creditPageState createState() => _creditPageState();
}

final _formKey = GlobalKey<FormState>();

String typeCredit;
List creditList = [
  "Crédit Automobile",
  "Crédit Agricole",
  "Crédit Habitation",
  "Crédit Consommation",
];

final salaire = TextEditingController()..text;
final valeurAcq = TextEditingController()..text;
final valeurApport = TextEditingController()..text;
final moisRembours = TextEditingController()..text;
//final typeCreditChoisis = TextEditingController()..text = '0';
double sal = double.parse(salaire.text);
double result;
//(total Prix Acquisition - apport Propre) / durée de remboursement en mois

double calculCredit(salaire, valeurAcq, valeurApport, moisRembours) {
  double res =
      (double.parse(valeurAcq.text) - double.parse(valeurApport.text)) /
          double.parse(moisRembours.text);
  return res;
}

double test = calculCredit(salaire, valeurAcq, valeurApport, moisRembours);

String nameInputValidator(value) {
  if (value == null || value.isEmpty || value == '0') {
    return 'Ce champ est obligatoire';
  }
}

class _creditPageState extends State<creditPage> {
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
                              "Pour être eligible a un crédit , il faut que la mensualité soit supérieur à 30% \nde votre salaire net. \n Réglement De Finance Tunisien.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            )),
                      ]),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                1.2,
                                Text(
                                  "Veuillez entrer votre salaire",
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
                                  if (value.isEmpty)
                                    return "Ce champ est obligatoire";
                                },
                                controller: salaire,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Votre salaire en DT",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                1.2,
                                Text(
                                  "Choissisez le type du crédit",
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
                              validator: (value) {
                                if (value == null) {
                                  return 'Ce champ est obligatoire';
                                }
                              },
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              dropdownColor: Colors.black,
                              decoration: new InputDecoration(
                                  hintText: "Types de crédit disponibles",
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
                                        color: Colors.purple[800], width: 2.0),
                                  )),
                              value: typeCredit,
                              onChanged: (newValue) {
                                setState(() {
                                  typeCredit = newValue;
                                });
                              },
                              items: creditList.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                1.2,
                                Text(
                                  "Choississez la durée de remboursement",
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
                                  if (value.isEmpty)
                                    return "Ce champ est obligatoire";
                                },
                                controller: moisRembours,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Durée en Mois - 12 Mois = 1 An",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                1.2,
                                Text(
                                  "Entrer la valeur d'aquisition",
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
                                  if (value.isEmpty)
                                    return "Ce champ est obligatoire";
                                },
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                controller: valeurAcq,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Montant du crédit en DT",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                1.2,
                                Text(
                                  "Entrer votre prope apport ",
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
                                  if (value.isEmpty)
                                    return "Ce champ est obligatoire";
                                },
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                controller: valeurApport,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Votre apport propre en DT",
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
                                      if ((calculCredit(salaire, valeurAcq,
                                              valeurApport, moisRembours)) <
                                          (double.parse(salaire.text) * 0.3)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Traitement en cours ..')),
                                        );

                                        Future.delayed(
                                            const Duration(seconds: 5), () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      succesPage(
                                                          salaire.text,
                                                          valeurApport.text,
                                                          valeurAcq.text,
                                                          moisRembours.text)));
                                        });
                                      } else {
                                        if ((calculCredit(salaire, valeurAcq,
                                                valeurApport, moisRembours)) >
                                            (double.parse(salaire.text) *
                                                0.3)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    ' Votre Salaire ne couvre pas votre mensualité.Pensez à diminuer le montant du crédit ou à augmenter votre apport.')),
                                          );
                                        }
                                      }
                                    }
                                  },
                                  color: Colors.purple[800],
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "Vérification",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}
