import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class PortfolioContent {
  // Personal Info
  static const String name = "Saurabh Shrivastava"; 
  static const String title = "Flutter Developer | Mobile Architect";
  static const String about = "I craft high-performance, beautiful mobile and web applications using Flutter. With a passion for clean code and pixel-perfect design, I bring ideas to life across all platforms.";
  static const String profileImage = "assets/profile.png"; 

  // Contact
  static const String email = "contact@example.com";
  static const String location = "Tech City, India";
  
  // Social Links
  static final List<SocialLink> socials = [
    SocialLink(icon: FontAwesomeIcons.github, url: "https://github.com", label: "GitHub"),
    SocialLink(icon: FontAwesomeIcons.linkedin, url: "https://linkedin.com", label: "LinkedIn"),
    SocialLink(icon: FontAwesomeIcons.twitter, url: "https://twitter.com", label: "Twitter"),
    SocialLink(icon: FontAwesomeIcons.envelope, url: "mailto:$email", label: "Email"),
  ];

  // Skills
  static const List<String> skills = [
    "Flutter", "Dart", "Firebase", "Riverpod", "Clean Architecture",
    "REST APIs", "Git", "UI/UX Implementation", "Material Design 3",
    "App Store Deployment"
  ];

  // Projects
  static final List<Project> projects = [
    Project(
      title: "Task Master",
      description: "A productivity app with cloud sync and local database.",
      tags: ["Flutter", "Hive", "Riverpod"],
      link: "https://github.com",
    ),
    Project(
      title: "EcoShop",
      description: "E-commerce platform with payment gateway integration.",
      tags: ["Flutter", "Stripe", "Firebase"],
      link: "https://github.com",
    ),
    Project(
      title: "ChatPulse",
      description: "Real-time messaging app with end-to-end encryption.",
      tags: ["Flutter", "WebSockets", "GetX"],
      link: "https://github.com",
    ),
  ];
}
 
class SocialLink {
  final IconData icon;
  final String url;
  final String label;

  SocialLink({required this.icon, required this.url, required this.label});
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String link;

  Project({required this.title, required this.description, required this.tags, required this.link});
}
