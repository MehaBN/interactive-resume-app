import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final skills = [
    {
      "name": "Java",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg",
      "level": 0.9
    },
    {
      "name": "C",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg",
      "level": 0.8
    },
    {
      "name": "HTML/CSS",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg",
      "level": 0.85
    },
    {
      "name": "Spring MVC",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/spring/spring-original.svg",
      "level": 0.75
    },
    {
      "name": "React.js",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg",
      "level": 0.7
    },
    {
      "name": "Node.js",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg",
      "level": 0.7
    },
    {
      "name": "Angular",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/angularjs/angularjs-original.svg",
      "level": 0.65
    },
    {
      "name": "MySQL",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg",
      "level": 0.8
    },
    {
      "name": "Flutter",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg",
      "level": 0.85
    },
    {
      "name": "Dart",
      "iconUrl": "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg",
      "level": 0.85
    },
  ];

  Widget buildSkillTile(Map<String, dynamic> skill) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
          skill["iconUrl"],
          width: 35,
          height: 35,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.code, color: Colors.white), // fallback if icon fails
        ),
        title: Text(
          skill["name"],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: skill["level"]),
            duration: Duration(seconds: 2),
            curve: Curves.easeOut,
            builder: (context, value, _) => LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[800],
              color: Colors.pinkAccent,
              minHeight: 8,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF121212),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "💡 My Skills",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          ...skills.map((skill) => buildSkillTile(skill)).toList(),
        ],
      ),
    );
  }
}
