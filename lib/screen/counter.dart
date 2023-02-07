import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterScreen extends HookWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final valueState = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${valueState.value}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                valueState.value += 1;
              },
              child: const Text("Add"),
            ),
            ElevatedButton(
              onPressed: () {
                valueState.value -= 1;
              },
              child: const Text("Min"),
            ),
          ],
        ),
      ),
    );
  }
}
