import 'package:flutter/material.dart';
import 'package:likhit/screens/payment/payLawyer.dart';

class Contracts extends StatefulWidget {
  const Contracts({super.key});

  @override
  State<Contracts> createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Inbox page")),
      ),
    );
  }
}
