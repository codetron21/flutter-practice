import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_practice/app/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocalizationScreen extends ConsumerWidget {

  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localization"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(localizationProvider.notifier).toggleLanguage();
                  },
                  child: Text(AppLocalizations.of(context).changeLanguage),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(AppLocalizations.of(context).helloWorld),
            ],
          ),
        ));
  }
}
