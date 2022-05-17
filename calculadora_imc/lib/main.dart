// ignore_for_file: deprecated_member_use

import 'package:calculadora_imc/calculatePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetFields,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  "O IMC (ou índice de massa corporal) é um cálculo simples que permite avaliar se a pessoa está dentro do peso que é considerado ideal para a sua altura.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu peso";
                    }
                    return null;
                  },
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.green,
                ),
                controller: heightController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua altura";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calculate(
                                weight: weightController.text,
                                height: heightController.text,
                              )
                          ),
                    );
                  },
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
