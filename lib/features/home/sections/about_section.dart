import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: ResponsiveLayout(
        mobile: _buildContent(context, isMobile: true),
        desktop: _buildContent(context, isMobile: false),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Column(
        children: [
          _sectionHeader(context, "ABOUT ME", "Crafting Digital Excellence"),
          const SizedBox(height: 60),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile) Expanded(flex: 2, child: _buildImageFrame()),
              if (!isMobile) const SizedBox(width: 80),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    if (isMobile) _buildImageFrame(),
                    if (isMobile) const SizedBox(height: 40),
                    Text(
                      "Flutter Developer with 1+ year of hands-on experience in developing cross-platform applications for Android, iOS, and Web using Flutter and Dart. Skilled in Firebase, Supabase, REST API integration, Riverpod state management, FCM, and responsive UI development. Experienced in building scalable and user-friendly applications across multiple platforms.",
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildStatsGrid(isMobile),
                  ],
                ),
              ),
            ],
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
          style: Theme
              .of(
            context,
          )
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.5),
        const SizedBox(height: 20),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ).animate().scaleX(begin: 0, duration: 600.ms),
      ],
    );
  }

  Widget _buildImageFrame() {
    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primary.withOpacity(0.5), width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Image.asset(
          'assets/sadia.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          errorBuilder: (context, error, stackTrace) =>
              Container(
                color: AppColors.darkCard,
                child: const Icon(
                    Icons.person, size: 100, color: Colors.white24),
              ),
        ),
      ),
    ).animate().fadeIn(duration: 1.seconds).slideX(begin: -0.1);
  }

  Widget _buildStatsGrid(bool isMobile) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isMobile ? 2 : 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1.5,
      children: [
        _statCard("1+", "Years Exp."),
        _statCard("50+", "Projects"),
        _statCard("20+", "Happy Clients"),
      ],
    );
  }


  Widget _statCard(String value, String label) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery
            .of(context)
            .size
            .width;

        final isMobile = screenWidth < 600;

        return GlassCard(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 20,
            vertical: isMobile ? 18 : 24,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 23 : 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: isMobile ? 5 : 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ).animate().scale(delay: 400.ms);
      },
    );
  }
}