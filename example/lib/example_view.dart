import 'package:flutter/material.dart';
import 'package:ui_toolkit/ui_toolkit.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Toolkit'),
      ),
      body: Column(
        children: [
          AsyncButton(
            text: 'Async Button',
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          )
        ],
      ),
    );
  }
}
