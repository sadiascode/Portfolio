import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Skill {
  final String name;
  final double level;
  final IconData icon;

  Skill({required this.name, required this.level, required this.icon});
}

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<Skill> skills = [
    Skill(name: 'Flutter (Android, iOS & Web)', level: 0.95, icon: Icons.flutter_dash),
    Skill(name: 'Dart', level: 0.9, icon: Icons.code),
    Skill(name: 'Firebase', level: 0.85, icon: Icons.cloud),
    Skill(name: 'Supabase', level: 0.8, icon: Icons.storage),
    Skill(name: 'REST API Integration & Data Handling', level: 0.9, icon: Icons.api),
    Skill(name: 'FCM Push Notifications', level: 0.85, icon: Icons.notifications),
    Skill(name: 'Agora', level: 0.8, icon: Icons.video_call),
    Skill(name: 'Git & GitHub', level: 0.9, icon: Icons.terminal),
    Skill(name: 'Responsive UI Design', level: 0.95, icon: Icons.devices),
    Skill(name: 'SQLite', level: 0.8, icon: Icons.data_usage),
    Skill(name: 'UI/UX Implementation', level: 0.8, icon: Icons.design_services),
    Skill(name: 'Riverpod', level: 0.85, icon: Icons.layers),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          _sectionHeader(context, "MY SKILLS", "Technologies I Master"),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveLayout.isMobile(context)
                    ? 2
                    : ResponsiveLayout.isTablet(context)
                        ? 3
                        : 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return _buildSkillCard(skills[index], index);
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

  Widget _buildSkillCard(Skill skill, int index) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(skill.icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 15),
          Text(
            skill.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 15),
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: skill.level,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ).animate().scaleX(
                      begin: 0,
                      duration: 1.5.seconds,
                      curve: Curves.easeOutCubic,
                      delay: (index * 100).ms,
                    ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 50).ms).slideY(begin: 0.2);
  }
}
