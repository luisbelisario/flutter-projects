// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Calculate extends StatefulWidget {
  String weight;
  String height;

  Calculate({
    Key? key,
    required this.weight,
    required this.height,
  }) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  double? imc;

  double? calculateIMC() {
    double weightInside = double.parse(widget.weight);
    double heightInside = double.parse(widget.height) / 100;

    imc = weightInside / (heightInside * heightInside);
    return imc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 300.0),
          child: Center(
            child: Column(children: [
              const Text(
                "Seu imc é",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                ),
              ),
              Text(
                calculateIMC()!.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                ),
              )
            ]),
          ),
        )
        );
  }
}
