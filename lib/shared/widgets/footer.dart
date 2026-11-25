import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/app_providers.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isSmallScreen ? 20 : 80,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        border: const Border(top: BorderSide(color: Colors.white12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Branding / Title
          Text(
            'SADIA',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 30),
          // Links – responsive layout
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isSmallScreen ? 10 : 30,
            runSpacing: 10,
            children: [
              _footerLink(context, 'Home', 'hero'),
              _footerLink(context, 'About', 'about'),
              _footerLink(context, 'Skills', 'skills'),
              _footerLink(context, 'Projects', 'projects'),
              _footerLink(context, 'Contact', 'contact'),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            '© 2026 Sadia. Built with Flutter & Love.',
            style: TextStyle(color: Colors.white24, fontSize: 12),
          ),
          const SizedBox(height: 20),
          IconButton(
            icon: const Icon(Icons.arrow_upward, color: AppColors.primary),
            onPressed: () => ScrollService.scrollTo('hero'),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(BuildContext context, String title, String section) {
    return InkWell(
      onTap: () => ScrollService.scrollTo(section),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ),
    );
  }
}
