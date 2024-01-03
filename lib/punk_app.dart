import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:punk/presentation/widgets/texts.dart';

class PunkApp extends StatelessWidget {
  final GoRouter goRouter;
  
  const PunkApp({super.key, required this.goRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      title: Texts.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
