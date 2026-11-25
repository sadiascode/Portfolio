import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Testimonial {
  final String name;
  final String quote;
  final double rating;

  Testimonial({
    required this.name,
    required this.quote,
    required this.rating,
  });
}

class TestimonialsSection extends StatelessWidget {
  TestimonialsSection({super.key});

  final List<Testimonial> testimonials = [
    Testimonial(
      name: 'Asif Mahmood',
      quote: 'Sadia was great to work with! She understood our requirements and delivered the app just the way we wanted. Really happy with the final result.',
      rating: 5,
    ),
    Testimonial(
      name: 'Shiv Parvati',
      quote: 'I had a wonderful experience working with Sadia. She was patient, professional, and made sure every feature worked as expected. Highly recommended!',
      rating: 5,
    ),
    Testimonial(
      name: 'Djsaja',
      quote: 'Sadia did an amazing job with our mobile application. The app looks beautiful, runs smoothly, and works exactly as we expected.',
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: AppColors.darkBackground.withOpacity(0.5),
      child: Column(
        children: [
          _sectionHeader(context, "TESTIMONIALS", "What Clients Say"),
          const SizedBox(height: 60),
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
              ),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                return Container(
                  width: ResponsiveLayout.isMobile(context) ? 300 : 400,
                  margin: const EdgeInsets.only(right: 30),
                  child: _buildTestimonialCard(testimonials[index], index),
                );
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

  Widget _buildTestimonialCard(Testimonial t, int index) {
    return GlassCard(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.lightTextPrimary,
                child: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: List.generate(
              5,
              (i) => Icon(
                Icons.star,
                size: 16,
                color: i < t.rating ? Colors.amber : Colors.white12,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '"${t.quote}"',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 200).ms).scale(begin: const Offset(0.9, 0.9));
  }
}
