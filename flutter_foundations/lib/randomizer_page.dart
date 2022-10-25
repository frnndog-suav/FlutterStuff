import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body: Center(child:
          Consumer<RandomizerChangeNotifier>(builder: (context, value, child) {
        return Text(
          value.generatedNumber?.toString() ?? "Generate a number",
          style: TextStyle(fontSize: 42),
        );
      })),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
