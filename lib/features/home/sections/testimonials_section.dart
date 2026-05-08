import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Testimonial {
  final String name;
  final String role;
  final String quote;
  final String avatar;
  final double rating;

  Testimonial({
    required this.name,
    required this.role,
    required this.quote,
    required this.avatar,
    required this.rating,
  });
}

class TestimonialsSection extends StatelessWidget {
  TestimonialsSection({super.key});

  final List<Testimonial> testimonials = [
    Testimonial(
      name: 'Alex Johnson',
      role: 'CEO, TechNova',
      quote: 'Sadia delivered a world-class Flutter application that exceeded our expectations. The attention to detail is remarkable.',
      avatar: 'https://i.pravatar.cc/150?u=alex',
      rating: 5,
    ),
    Testimonial(
      name: 'Sarah Miller',
      role: 'Product Manager, FitLife',
      quote: 'Working with Sadia was a breeze. She understood our requirements perfectly and implemented them with high quality.',
      avatar: 'https://i.pravatar.cc/150?u=sarah',
      rating: 5,
    ),
    Testimonial(
      name: 'David Chen',
      role: 'Founder, CryptoDash',
      quote: 'The animations and responsiveness of our dashboard are incredible. Highly recommend her for any premium project.',
      avatar: 'https://i.pravatar.cc/150?u=david',
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
                backgroundImage: NetworkImage(t.avatar),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    t.role,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
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
