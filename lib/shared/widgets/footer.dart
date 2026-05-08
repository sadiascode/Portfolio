import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/app_providers.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        border: const Border(top: BorderSide(color: Colors.white12)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SADIA.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () => ScrollService.scrollTo(section),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ),
    );
  }
}
