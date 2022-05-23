// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompleteAddress extends StatefulWidget {
  const CompleteAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteAddress> createState() => _CompleteAddress();
}

class _CompleteAddress extends State<CompleteAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
    );
  }
}
