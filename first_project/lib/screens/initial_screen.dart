import 'package:first_project/components/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: opacidade ? 1 : 0,
        child: ListView(
          children: const [
            Task(
                'Batata',
                'assets/images/9577676-middle.png',
                3),
            Task(
                'Teste',
                'assets/images/Eu7oCq2WQAEyVnt.png',
                5),
            Task(
                'Goia', "assets/images/learn-expert-dash.png", 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
