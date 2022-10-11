import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({super.key});

  @override
  State<FormularioTransferencia> createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final _controladorCampoNumeroConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: "Número da conta",
                dica: "0000"),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: "Valor",
                dica: "0.00",
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, _criaTransferencia()),
                child: const Text("Confirmar"))
          ],
        ),
      ),
    );
  }

  Transferencia _criaTransferencia() {
    return Transferencia(double.tryParse(_controladorCampoValor.text) ?? 0,
        int.tryParse(_controladorCampoNumeroConta.text) ?? 0);
  }
}
