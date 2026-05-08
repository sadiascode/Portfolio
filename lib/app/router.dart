import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/home_screen.dart';
import '../features/home/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // Placeholder for blog or other pages
    GoRoute(
      path: '/blog',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Blog coming soon...')),
      ),
    ),
  ],
);
