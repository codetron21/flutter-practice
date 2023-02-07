import 'package:flutter/material.dart';
import 'package:flutter_practice/screen/consume.dart';
import 'package:flutter_practice/screen/copy.dart';
import 'package:flutter_practice/screen/counter.dart';
import 'package:flutter_practice/screen/menu.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(MyApp());
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
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
