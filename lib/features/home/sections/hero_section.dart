import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.8, -0.5),
          radius: 1.5,
          colors: [AppColors.primary.withOpacity(0.1), Colors.transparent],
        ),
      ),
      child: ResponsiveLayout(
        mobile: _buildContent(context, isMobile: true),
        desktop: _buildContent(context, isMobile: false),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Semantics(
                  header: true,
                  label: "Introduction: Hi, I'm Sadia",
                  child: Text(
                    "HI, I'M SADIA AKTER MOON",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.2),
                const SizedBox(height: 20),
                SizedBox(
                  height: isMobile ? 120 : 180,
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: isMobile ? 40 : 80,
                      height: 1.1,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Flutter Developer'),
                        TypewriterAnimatedText('Cross-Platform App Developer'),
                        TypewriterAnimatedText('Mobile App Engineer'),
                        TypewriterAnimatedText('UI/UX Focused Developer'),
                        TypewriterAnimatedText('Modern Flutter Developer'),
                      ],
                      repeatForever: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Building premium cross-platform experiences with Flutter and modern cloud architectures. Let's turn your vision into a world-class application.",
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isMobile ? 16 : 20,
                    color: AppColors.darkTextSecondary,
                  ),
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
                const SizedBox(height: 40),
                Wrap(
                  alignment: isMobile
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _ctaButton(
                      context,
                      "Hire Me",
                      isPrimary: true,
                      onPressed: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'rahmanrohasadia@gmail.com',
                        );
                        await launchUrl(emailLaunchUri);
                      },
                    ),
                    _ctaButton(
                      context,
                      "Download CV",
                      isPrimary: false,
                      onPressed: () async {
                        final Uri cvUri = Uri.parse(
                          'https://drive.google.com/file/d/1-pXYH4IJjhVsTUKKnWhA8jHkVxSc8dj-/view?usp=sharing',
                        );
                        await launchUrl(
                          cvUri,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ],
                ).animate().fadeIn(delay: 800.ms),
              ],
            ),
          ),
          if (!isMobile)
            Expanded(
              flex: 2,
              child: Center(
                child:
                    Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppColors.primaryGradient,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 50,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/sadia.png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .moveY(
                          begin: -20,
                          end: 20,
                          duration: 2.seconds,
                          curve: Curves.easeInOut,
                        ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _ctaButton(
    BuildContext context,
    String text, {
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: isPrimary ? AppColors.primaryGradient : null,
        border: isPrimary ? null : Border.all(color: Colors.white24, width: 2),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
