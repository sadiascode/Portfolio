import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/glass_card.dart';

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final activeSection = ref.watch(activeSectionProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        borderRadius: 50,
        child: Row(
          children: [
            // Logo
            Text(
              'SADIA.',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppColors.primary,
                  ),
            ),
            const Spacer(),
            // Desktop Links
            if (MediaQuery.of(context).size.width > 900)
              Row(
                children: [
                  _navItem(context, ref, 'Home', 'hero', activeSection),
                  _navItem(context, ref, 'About', 'about', activeSection),
                  _navItem(context, ref, 'Skills', 'skills', activeSection),
                  _navItem(context, ref, 'Projects', 'projects', activeSection),
                  _navItem(context, ref, 'Contact', 'contact', activeSection),
                ],
              ),
            const SizedBox(width: 20),
            // Theme Toggle
            IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                ref.read(themeProvider.notifier).state =
                    isDark ? ThemeMode.light : ThemeMode.dark;
              },
            ),
            // Mobile Menu
            if (MediaQuery.of(context).size.width <= 900)
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    WidgetRef ref,
    String title,
    String section,
    String activeSection,
  ) {
    final isActive = activeSection == section;
    return TextButton(
      onPressed: () {
        ref.read(activeSectionProvider.notifier).state = section;
        ScrollService.scrollTo(section);
      },
      child: Text(
        title,
        style: TextStyle(
          color: isActive
              ? AppColors.primary
              : Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
