import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/home/sections/education_section.dart';
import '../../shared/widgets/navbar.dart';
import '../../providers/app_providers.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/services_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/contact_section.dart';
import '../../shared/widgets/footer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late ScrollController _scrollController;
  Offset _mousePos = Offset.zero;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileDrawer(),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            _mousePos = event.position;
          });
        },
        child: Stack(
          children: [
            // Cursor Glow Effect
            Positioned(
              left: _mousePos.dx - 150,
              top: _mousePos.dy - 150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Main Content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(key: ScrollService.sectionKeys['hero']),
                  AboutSection(key: ScrollService.sectionKeys['about']),
                  EducationSection(key: ScrollService.sectionKeys['education']),
                  SkillsSection(key: ScrollService.sectionKeys['skills']),
                  ServicesSection(key: ScrollService.sectionKeys['services']),
                  ProjectsSection(key: ScrollService.sectionKeys['projects']),
                  ExperienceSection(key: ScrollService.sectionKeys['experience']),
                  TestimonialsSection(key: ScrollService.sectionKeys['testimonials']),
                  ContactSection(key: ScrollService.sectionKeys['contact']),
                  const Footer(),
                ],
              ),
            ),
            // Sticky Navbar
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Navbar(),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'SADIA AKTER MOON',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          _drawerItem(ref, 'Home', 'hero'),
          _drawerItem(ref, 'About', 'about'),
          _drawerItem(ref, 'Skills', 'skills'),
          _drawerItem(ref, 'Projects', 'projects'),
          _drawerItem(ref, 'Contact', 'contact'),
        ],
      ),
    );
  }

  Widget _drawerItem(WidgetRef ref, String title, String section) {
    return ListTile(
      title: Text(title),
      onTap: () {
        ref.read(activeSectionProvider.notifier).state = section;
        ScrollService.scrollTo(section);
        Navigator.pop(ref.context);
      },
    );
  }
}
