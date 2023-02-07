import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hooks practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go("/counter");
              },
              child: const Text("Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go("/consume");
              },
              child: const Text("Consume API"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go("/copy");
              },
              child: const Text("Copy"),
            ),
          ],
        ),
      ),
    );
  }
}
