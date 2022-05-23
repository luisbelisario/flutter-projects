// ignore_for_file: deprecated_member_use
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
  TextEditingController cepController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void resetFields() {
    setState(() {
      cepController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Consulta CEP"),
          backgroundColor: Colors.amber,
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
                Padding(
                  padding: const EdgeInsets.only(top: 180.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Digite o CEP",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.amber,
                    ),
                    controller: cepController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira o CEP";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: RaisedButton(
                    onPressed: () {},
                    child: const Text(
                      "Pesquisar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
