import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const transferenciaTitle = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  List<Transferencia> transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(transferenciaTitle)),
      body: ListView.builder(
          itemCount: transferencias.length,
          itemBuilder: (context, indice) {
            return ItemTransferencia(transferencias[indice]);
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FormularioTransferencia();
            })).then((transferenciaRecebida) {
              atualizaTransferencia(transferenciaRecebida);
            });
          }),
    );
  }

  void atualizaTransferencia(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
