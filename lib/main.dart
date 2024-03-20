import 'package:flutter/material.dart';
import 'package:movies_catalogue/presentation/screens/details_screen.dart';
import 'package:movies_catalogue/presentation/screens/home_screen.dart';

import 'package:provider/provider.dart';

import 'core/providers/movies_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
      },
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
        color: Color(0xff16CBBF),
      )),
    );
  }
}
