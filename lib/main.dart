import 'package:coding_test_app/code_bloc.dart';
import 'package:coding_test_app/coding_screen.dart';
import 'package:coding_test_app/problem_screen.dart';
import 'package:coding_test_app/problems_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final theme = ThemeData(
  useMaterial3: true,
  canvasColor: const Color.fromRGBO(26, 26, 26, 1),
  colorSchemeSeed: Colors.black87,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1),
  cardTheme: const CardTheme(color: Color.fromRGBO(42, 42, 42, 1)),
  searchBarTheme: SearchBarThemeData(
    side: MaterialStateProperty.all(BorderSide.none),
    backgroundColor:
        MaterialStateProperty.all(const Color.fromRGBO(42, 42, 42, 1)),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
  ),
);

final router = GoRouter(
  initialLocation: "/problems",
  routes: [
    GoRoute(
      name: 'problems',
      path: '/problems',
      builder: (context, _) => const ProblemsListScreen(),
      routes: [
        GoRoute(
          name: 'problem',
          path: 'problem',
          builder: (context, _) => const ProblemScreen(),
          routes: [
            GoRoute(
              name: 'code',
              path: 'code',
              builder: (context, _) => const CodingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CodeBloc>(
      create: (_) => CodeBloc(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: theme,
        darkTheme: theme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
