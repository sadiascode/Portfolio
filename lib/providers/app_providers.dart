import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

final activeSectionProvider = StateProvider<String>((ref) => 'hero');

class ScrollService {
  static final Map<String, GlobalKey> sectionKeys = {
    'hero': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'services': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'testimonials': GlobalKey(),
    'contact': GlobalKey(),
    'education': GlobalKey(),
    'achievements': GlobalKey(),
  };

  static void scrollTo(String section) {
    final key = sectionKeys[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}
