// ignore_for_file: non_constant_identifier_names, must_be_immutable, unnecessary_brace_in_string_interps, unused_field, missing_return

import 'package:bank_app_ihebbouhamed/AjoutCarteCredit.dart';
import 'package:bank_app_ihebbouhamed/credit.dart';
import 'package:bank_app_ihebbouhamed/currency.dart';
import 'package:flutter/material.dart';

double soldeProfession(String professionChoosedController) {
  if (professionChoosedController == "Banquier") return 1500;

  if (professionChoosedController == "Docteur") return 6000;

  if (professionChoosedController == "Ingénieur") return 8000;

  if (professionChoosedController == "Technicien") return 1000;

  if (professionChoosedController == "Enseignant") return 2000;
}

class DashboardPage extends StatelessWidget {
  String firstnameController,
      lastnameController,
      cartNumberController,
      professionChoosedController;

  //Constructeur du screen DashboardPage
  DashboardPage(this.firstnameController, this.lastnameController,
      this.cartNumberController, this.professionChoosedController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
        child: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 0, left: 10, right: 10),
          child: MaterialButton(
            onPressed: () {},
            child: Column(
              children: [
                Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 22,
                                  vertical: 9,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Balance :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Text(
                                    soldeProfession(professionChoosedController)
                                            .toString() +
                                        "DT",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Titulaire du Compte : $firstnameController $lastnameController ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Text(
                                                'Numero Carte : $cartNumberController',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          )
                                        ])
                                      ]))
                            ]))),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => creditPage()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/credit.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Effectuer une ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Demande Crédit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AjoutCarteCredit()));
                      },
                      child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: 100.0,
                                  width: 100.0,
                                  padding: EdgeInsets.all(55.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      'assets/cc.png',
                                    ),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Ajouter une ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Carte Crédit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConvertDevise()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 90,
                                  width: 90,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  padding: EdgeInsets.all(55.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/exchange.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Effectuer un ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Echange Devise",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('En cours de développement')),
                        );
                      },
                      child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: 80.0,
                                  width: 80.0,
                                  margin: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(55.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      'assets/chart.png',
                                    ),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Suivi des",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Dépenses",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('En cours de développement')),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 70,
                                  width: 100,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(50.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/payroll.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Effectuer un",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Transfert Crédit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: MaterialButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('En cours de développement')),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 70,
                                  width: 100,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(50.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/qr.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Capteur du",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Code QR",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        )),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => creditPage()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/credit.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Effectuer une ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Demande Crédit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AjoutCarteCredit()));
                      },
                      child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: 100.0,
                                  width: 100.0,
                                  padding: EdgeInsets.all(55.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      'assets/cc.png',
                                    ),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Ajouter une ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Carte Crédit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 90,
                                  width: 90,
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 5,
                                  ),
                                  padding: EdgeInsets.all(55.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/exchange.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Effectuer un ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Echange Devise",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: 80.0,
                                  width: 80.0,
                                  margin: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(55.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                      'assets/chart.png',
                                    ),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Suivi des",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Dépenses",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 70,
                                  width: 100,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(50.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/payroll.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Effectuer un",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Transfert Crédit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Expanded(
                    child: MaterialButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                  height: 70,
                                  width: 100,
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(50.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/qr.png'),

                                    //color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(20.0),
                                  ))),
                              Text("Capteur du",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                              Text("Code QR",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        )),
                  ),
                ])
                */