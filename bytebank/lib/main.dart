import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent[700])),
      home: const ListaTransferencia(),
    );
  }
}
