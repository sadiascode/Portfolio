import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/responsive_layout.dart';

class Service {
  final String title;
  final String description;
  final IconData icon;

  Service({required this.title, required this.description, required this.icon});
}

class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final List<Service> services = [
    Service(
      title: 'App Development',
      description: 'Building high-performance, scalable mobile & web apps.',
      icon: Icons.mobile_friendly,
    ),
    Service(
      title: 'UI Implementation',
      description: 'Turning complex designs into pixel-perfect Flutter code.',
      icon: Icons.palette,
    ),
    Service(
      title: 'API Integration',
      description: 'Connecting apps with robust REST & GraphQL backends.',
      icon: Icons.api,
    ),
    Service(
      title: 'Firebase Backend',
      description: 'Setup and management of cloud functions, DB, and auth.',
      icon: Icons.cloud_done,
    ),
    Service(
      title: 'Optimization',
      description: 'Improving app performance and reducing load times.',
      icon: Icons.speed,
    ),
    Service(
      title: 'Maintenance',
      description: 'Continuous support, bug fixing, and feature updates.',
      icon: Icons.support_agent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: AppColors.darkBackground.withOpacity(0.5),
      child: Column(
        children: [
          _sectionHeader(context, "SERVICES", "What I Offer"),
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
                    ? 1
                    : ResponsiveLayout.isTablet(context)
                        ? 2
                        : 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1.4,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return _buildServiceCard(services[index], index);
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

  Widget _buildServiceCard(Service service, int index) {
    return GlassCard(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(service.icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: 20),
          Text(
            service.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            service.description,
            style: const TextStyle(color: Colors.white70, height: 1.5),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 100).ms).slideX(begin: 0.1);
  }
}
