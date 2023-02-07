import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const textCopied = "Text copied";

class CopyScreen extends StatelessWidget {
  const CopyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Copy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(textCopied),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  onTap: () {
                    debugPrint("print");
                    Clipboard.setData(const ClipboardData(text: textCopied));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Value copied"),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: const Icon(Icons.copy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
