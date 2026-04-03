import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'index.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/homePage',
  routes: [
    GoRoute(
      path: '/homePage',
      name: HomePageWidget.routeName,
      builder: (context, state) => const HomePageWidget(),
    ),
    GoRoute(
      path: '/profile',
      name: ProfileWidget.routeName,
      builder: (context, state) => const ProfileWidget(),
    ),
    GoRoute(
      path: '/heartRate',
      name: HeartRateWidget.routeName,
      builder: (context, state) => const HeartRateWidget(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Health Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0F1117),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: _router,
    );
  }
}
