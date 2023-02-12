import 'package:flutter/material.dart';
import 'package:flutter_practice/screen/consume.dart';
import 'package:flutter_practice/screen/copy.dart';
import 'package:flutter_practice/screen/counter.dart';
import 'package:flutter_practice/screen/localization.dart';
import 'package:flutter_practice/screen/menu.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MenuScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'counter',
          builder: (BuildContext context, GoRouterState state) {
            return const CounterScreen();
          },
        ),
        GoRoute(
          path: 'consume',
          builder: (BuildContext context, GoRouterState state) {
            return const ConsumeScreen();
          },
        ),
        GoRoute(
          path: 'copy',
          builder: (BuildContext context, GoRouterState state) {
            return const CopyScreen();
          },
        ),
        GoRoute(
          path: 'local',
          builder: (BuildContext context, GoRouterState state) {
            return const LocalizationScreen();
          },
        ),
      ],
    ),
  ],
);

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier():super(const Locale.fromSubtags(languageCode: "en"));
  void toggleLanguage() {
    if(state.languageCode == "en"){
      state = const Locale.fromSubtags(languageCode: "id");
    }else {
      state = const Locale.fromSubtags(languageCode: "en");
    }
  }
}

final localizationProvider = StateNotifierProvider<LocalizationNotifier,Locale>((_) => LocalizationNotifier());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child:Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? _) {
          return MaterialApp.router(
              routerConfig: _router,
              locale: ref.watch(localizationProvider),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales
          );
        },
      )
    );
  }
}
