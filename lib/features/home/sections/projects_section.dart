import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Project {
  final String title;
  final String description;
  final String image;
  final List<String> tech;

  Project({
    required this.title,
    required this.description,
    required this.image,
    required this.tech,
  });
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = [
    Project(
      title: 'Financing App',
      description: 'A comprehensive device financing application that enables customers to purchase smartphones, tablets, and electronics through flexible EMI plans. Features include secure authentication, product browsing, GPS-based delivery validation, account selection, EMI calculation, OTP verification, loan management, and PDF receipt generation.',
      image: 'assets/financing.png',
      tech: [
        'Flutter',
        'Riverpod',
        'REST API',
        'Shared Preferences',
        'GPS & Location',
        'Clean Architecture',
      ],
    ),
    Project(
      title: 'MedAI',
      description: 'AI-powered healthcare app featuring chatbot assistance, prescription upload, automatic medicine scheduling, reminders, and doctor communication.',
      image: 'assets/medai.jpeg',
      tech: ['Flutter', 'Dart', 'REST API', 'AI Chatbot'],
    ),
    Project(
      title: 'MicroLoan',
      description: 'Smart loan management app featuring loan applications, eligibility checks, KYC verification, flexible EMI plans, and repayment tracking.',
      image: 'assets/eloan.jpeg',
      tech: ['Flutter', 'Dart', 'REST API'],
    ),
    Project(
      title: 'Top Talent Agency',
      description: 'Multi-role talent management platform featuring performance analytics, rankings, AI-powered insights, risk monitoring, and real-time data management.',
      image: 'assets/toptalent.jpeg',
      tech: ['Flutter', 'Dart', 'REST API', 'Riverpod'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          _sectionHeader(context, "PORTFOLIO", "Featured Projects"),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveLayout.isMobile(context) ? 1 : 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                childAspectRatio: 1.1,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return _buildProjectCard(projects[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ).animate().fadeIn().slideY(begin: 0.5),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.5),
      ],
    );
  }

  Widget _buildProjectCard(Project project, int index) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  project.image.endsWith('.svg')
                      ? SvgPicture.asset(
                          project.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          project.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Wrap(
                      spacing: 10,
                      children: project.tech
                          .map((t) => _techBadge(t))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  project.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70, height: 1.5),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _iconButton(Icons.code, "GitHub"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 200).ms).slideY(begin: 0.2);
  }

  Widget _techBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _iconButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
