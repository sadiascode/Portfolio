import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Experience {
  final String year;
  final String title;
  final String company;
  final String description;

  Experience({
    required this.year,
    required this.title,
    required this.company,
    required this.description,
  });
}

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});

  final List<Experience> experiences = [
    Experience(
      year: '2023 - Present',
      title: 'Senior Flutter Developer',
      company: 'TechFlow Solutions',
      description: 'Leading the mobile team in developing high-scale FinTech applications.',
    ),
    Experience(
      year: '2021 - 2023',
      title: 'Flutter Developer',
      company: 'Innovate App Studio',
      description: 'Developed and maintained 10+ cross-platform apps for global clients.',
    ),
    Experience(
      year: '2020 - 2021',
      title: 'Junior App Developer',
      company: 'Digital Pulse',
      description: 'Started the journey with native Android and transitioned to Flutter.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          _sectionHeader(context, "EXPERIENCE", "My Professional Journey"),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return _buildTimelineItem(experiences[index], index);
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

  Widget _buildTimelineItem(Experience exp, int index) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.white12,
                ),
              ),
            ],
          ),
          const SizedBox(width: 30),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: GlassCard(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.year,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      exp.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      exp.company,
                      style: const TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      exp.description,
                      style: const TextStyle(color: Colors.white70, height: 1.5),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: (index * 200).ms).slideX(begin: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
