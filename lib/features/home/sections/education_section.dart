import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Education {
  final String degree;
  final String institution;
  final String period;
  final String description;

  const Education({required this.degree, required this.institution, required this.period, required this.description});
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  final List<Education> educations = const [
    Education(
      degree: 'B.Sc. in Computer Science and Engineering',
      institution: 'Varendra University',
      period: '2025',
      description: 'Focused on software development, data structures, and algorithms.',
    ),
    Education(
      degree: 'Higher Secondary Certificate (Science)',
      institution: "Govt. M. R. Women's College",
      period: '2020',
      description: 'Science stream with emphasis on physics, chemistry, and mathematics.',
    ),
    Education(
      degree: 'Secondary School Certificate (Science)',
      institution: 'Bhandari Girls High School',
      period: '2018',
      description: 'Foundation education with strong academic record.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          _sectionHeader(context, "EDUCATION", "My Academic Background"),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveLayout.isMobile(context) ? 1 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: educations.length,
              itemBuilder: (context, index) => _buildEducationCard(educations[index]),
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
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.5),
      ],
    );
  }

  Widget _buildEducationCard(Education edu) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(edu.degree, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(edu.institution, style: const TextStyle(fontSize: 16, color: Colors.white70)),
          const SizedBox(height: 4),
          Text(edu.period, style: const TextStyle(fontSize: 14, color: Colors.white54)),
          const SizedBox(height: 8),
          Text(edu.description, style: const TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    ).animate().fadeIn();
  }
}
