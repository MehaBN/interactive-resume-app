import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> projects = [
    {
      "title": "PlantGuard | CNN",
      "image": "assets/plantguard.png",
      "description":
          "AI-powered system for early detection and severity analysis of diseases in perennial crops like coffee, tea, and cinnamon.",
      "more":
          "Uses CNN + transfer learning for accurate detection, with a simple dashboard for farmers to upload leaf images and get treatment suggestions.",
      "tech": "CNN, Transfer Learning, Web Interface",
      "link": "https://github.com/yourusername/resume_app"
    },
    {
      "title": "MindFit | Mental Health",
      "image": "assets/mindfit.png",
      "description":
          "A platform to monitor and improve mental well-being using quizzes and progress tracking.",
      "more": "Stores latest results only, with profile integration.",
      "tech": "Spring Boot, MySQL, Thymeleaf",
      "link": "https://github.com/yourusername/mindfit"
    },
    {
      "title": "Matrimonial Website",
      "image": "assets/matrimonial.png",
      "description":
          "Full-stack matrimonial website using Angular (frontend) and Java Spring Boot (backend).",
      "more":
          "The platform allows profile creation, matchmaking, and secure communication. Data is stored in MySQL and the UI is responsive.",
      "tech": "Java, Spring Boot, Angular, MySQL",
      "link": "https://yourportfolio.com"
    },
    {
      "title": "Habit Tracker",
      "image": "assets/habit_tracker.png",
      "description":
          "Web app for creating, managing, and tracking daily habits with CRUD functionality.",
      "more":
          "Built with Spring Boot and Thymeleaf. Uses MySQL for persistent data storage. Helps users build positive routines.",
      "tech": "Java, Spring Boot, Thymeleaf, MySQL",
      "link": "https://yourportfolio.com"
    },
    {
      "title": "Interactive Resume App",
      "image": "assets/resume_app.png",
      "description":
          "Flutter app showcasing personal profile, skills, projects, and experience.",
      "more":
          "Includes animations, dark mode, and contact form integration. Fully responsive across devices.",
      "tech": "Flutter, Dart",
      "link": "https://yourportfolio.com"
    },
  ];

  final List<bool> _visibleList = [];
  final List<bool> _hoveringList = [];

  @override
  void initState() {
    super.initState();
    _visibleList.addAll(List.filled(projects.length, false));
    _hoveringList.addAll(List.filled(projects.length, false));

    // Staggered animation: each card appears one by one
    for (int i = 0; i < projects.length; i++) {
      Future.delayed(Duration(milliseconds: 200 * i), () {
        if (mounted) {
          setState(() {
            _visibleList[i] = true;
          });
        }
      });
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not launch $url")),
      );
    }
  }

void _showMoreDialog(Map<String, dynamic> project) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Project Details",
    pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
    transitionBuilder: (context, anim1, anim2, child) {
      final screenWidth = MediaQuery.of(context).size.width;
      double dialogWidth;

      if (screenWidth < 500) {
        dialogWidth = screenWidth * 0.9; // Mobile
      } else if (screenWidth < 1200) {
        dialogWidth = 500; // Tablet / small desktop
      } else {
        dialogWidth = 900; // Large desktop
      }

      return Center(
        child: Transform.scale(
          scale: anim1.value,
          child: Opacity(
            opacity: anim1.value,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: dialogWidth),
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(project["image"],
                            height: 160, fit: BoxFit.cover),
                        const SizedBox(height: 12),
                        Text(
                          project["description"],
                          style: TextStyle(
                              color: Color.fromARGB(255, 231, 134, 209), fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project["more"],
                          style: TextStyle(color:Color.fromARGB(255, 236, 135, 155), fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Tech Used: ${project["tech"]}",
                          style: TextStyle(color: Color(0xFFE7F4EA), fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () => _launchURL(project["link"]),
                          child: const Text(
                            "🔗 View on GitHub",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Close",
                              style: TextStyle(color: Color(0xFFE9609C) ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}




  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1200 : double.infinity,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop ? 2 : 1,
                  crossAxisSpacing: isDesktop ? 24 : 16,
                  mainAxisSpacing: 24,
                  childAspectRatio: isDesktop ? 1.6 : 1.2,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return MouseRegion(
                    onEnter: (_) {
                      if (isDesktop) {
                        setState(() {
                          _hoveringList[index] = true;
                        });
                      }
                    },
                    onExit: (_) {
                      if (isDesktop) {
                        setState(() {
                          _hoveringList[index] = false;
                        });
                      }
                    },
                    child: AnimatedScale(
                      scale: _hoveringList[index] ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        opacity: _visibleList[index] ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset: _visibleList[index]
                              ? Offset.zero
                              : const Offset(0, 0.2),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        project["image"],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    project["title"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    project["description"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () => _showMoreDialog(project),
                                      style: TextButton.styleFrom(
                                        foregroundColor: const Color(0xFFFF688C), // <-- Set "View More" text color
                                      ),
                                      child: const Text("View More"),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
