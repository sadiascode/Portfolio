import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      title: 'E-commerce SuperApp',
      description: 'A full-featured multi-vendor marketplace with real-time tracking.',
      image: 'https://images.unsplash.com/photo-1557821552-17105176677c?auto=format&fit=crop&q=80&w=600',
      tech: ['Flutter', 'Firebase', 'Stripe'],
    ),
    Project(
      title: 'Health Tracker',
      description: 'Real-time health monitoring app with wearable integration.',
      image: 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&q=80&w=600',
      tech: ['Flutter', 'Supabase', 'IoT'],
    ),
    Project(
      title: 'Crypto Dashboard',
      description: 'Advanced crypto portfolio tracker with live data feeds.',
      image: 'https://images.unsplash.com/photo-1621761191319-c6fb62004040?auto=format&fit=crop&q=80&w=600',
      tech: ['Flutter', 'REST API', 'Charts'],
    ),
    Project(
      title: 'Foodie Delivery',
      description: 'On-demand food delivery app with real-time maps.',
      image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&q=80&w=600',
      tech: ['Flutter', 'Google Maps', 'Node.js'],
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
                  Image.network(
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
                  style: const TextStyle(color: Colors.white70, height: 1.5),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _iconButton(Icons.link, "Live"),
                    const SizedBox(width: 20),
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
