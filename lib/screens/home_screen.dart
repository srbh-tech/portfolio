import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            children: [
              _HeaderSection(isDesktop: isDesktop),
              const SizedBox(height: 80),
              _AboutSection(),
              const SizedBox(height: 80),
              _SkillsSection(),
              const SizedBox(height: 80),
              _ProjectsSection(isDesktop: isDesktop),
              const SizedBox(height: 80),
              const _FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final bool isDesktop;
  const _HeaderSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: isDesktop ? 2 : 0,
          child: Column(
            crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                "Hi, I'm",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
              const SizedBox(height: 10),
              Text(
                PortfolioContent.name,
                style: const TextStyle(
                  color:  Color(0xFFCCD6F6),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
              const SizedBox(height: 10),
              Text(
                PortfolioContent.title,
                style: const TextStyle(
                  color: Color(0xFF8892B0),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
              const SizedBox(height: 30),
              Wrap(
                alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: PortfolioContent.socials.map((social) => 
                  IconButton(
                    onPressed: () => launchUrl(Uri.parse(social.url)),
                    icon: FaIcon(social.icon, color: const Color(0xFFCCD6F6), size: 24),
                    tooltip: social.label,
                  )
                ).toList(),
              ).animate().fadeIn(delay: 600.ms),
            ],
          ),
        ),
        if (isDesktop) const SizedBox(width: 40),
        if (!isDesktop) const SizedBox(height: 40),
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              )
            ],
            image: const DecorationImage(
              image: AssetImage(PortfolioContent.profileImage),
              fit: BoxFit.cover,
            ),
          ),
        ).animate().fadeIn(delay: 800.ms).scale(),
      ],
    );
  }
}

class _AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SectionTitle(title: "About Me", number: "01"),
         const SizedBox(height: 20),
         Text(
           PortfolioContent.about,
           style: const TextStyle(fontSize: 18, height: 1.6),
         ),
      ],
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1);
  }
}

class _SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Technologies", number: "02"),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: PortfolioContent.skills.map((skill) => _SkillChip(label: skill)).toList(),
        ),
      ],
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  const _ProjectsSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Things I've Built", number: "03"),
        const SizedBox(height: 30),
        LayoutBuilder(builder: (context, constraints) {
          int crossAxisCount = isDesktop ? 2 : 1;
          // Calculate height based on simple aspect ratio estimation or fixed height
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: PortfolioContent.projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(project: PortfolioContent.projects[index]);
            },
          );
        }),
      ],
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          "Built with Flutter by ${PortfolioContent.name}",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}

// --- Widgets ---

class SectionTitle extends StatelessWidget {
  final String title;
  final String number;
  
  const SectionTitle({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$number.", 
          style: TextStyle(fontFamily: 'RobotoMono', color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Color(0xFFCCD6F6)),
        ),
        const SizedBox(width: 20),
        Expanded(child: Container(height: 1, color: const Color(0xFF233554))),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF112240),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.normal),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        transform: Matrix4.identity()..translate(0.0, isHovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          color: const Color(0xFF112240),
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHovered
              ? [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.folder_open, color: Theme.of(context).primaryColor, size: 40),
                    IconButton(
                      icon: const Icon(Icons.open_in_new, color: Colors.grey),
                      onPressed: () => launchUrl(Uri.parse(widget.project.link)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.project.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFCCD6F6)),
                ),
                const SizedBox(height: 10),
                Text(
                   widget.project.description,
                   style: const TextStyle(color: Color(0xFF8892B0), fontSize: 16),
                   maxLines: 3,
                   overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Wrap(
              spacing: 12,
              children: widget.project.tags.map((t) => Text(t, style: const TextStyle(fontSize: 12, color: Colors.grey))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
