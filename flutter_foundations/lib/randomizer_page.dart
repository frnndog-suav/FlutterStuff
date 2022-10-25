import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body: Center(
          child: Text(
        randomizer.generatedNumber?.toString() ?? "Generate a number",
        style: TextStyle(fontSize: 42),
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Generate"),
        onPressed: () {
          ref.read(randomizerProvider).generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
