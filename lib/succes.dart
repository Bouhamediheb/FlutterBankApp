// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'animation/FadeAnimation.dart';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');
final String formatted = formatter.format(now);

class succesPage extends StatelessWidget {
  String salaire, valeurAcq, valeurApport, moisRembours;

  //Constructeur du screen successPage
  succesPage(
      this.salaire, this.valeurApport, this.valeurAcq, this.moisRembours);

  double calculCredit(salaire, valeurAcq, valeurApport, moisRembours) {
    double res = ((double.parse(valeurAcq) - double.parse(valeurApport)) /
        double.parse(moisRembours));
    return res;
  }

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
                SizedBox(
                  height: 300,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Votre crédit peut-être accordé .\n Veuillez prendre en considération que ces résultats sont pour $formatted",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Votre Salaire : $salaire",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Le montant du crédit : $valeurAcq",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Le montant de votre apport : $valeurApport",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Nombre de mois de remboursement : $moisRembours",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "----------------------------------------",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Le montant à rembourser DT/Mois : ${calculCredit(salaire, valeurAcq, valeurApport, moisRembours).toString()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
