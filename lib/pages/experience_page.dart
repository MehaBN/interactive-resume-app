import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  final List<Map<String, String>> experience = [
    {
      "title": "Infosys Internship",
      "subtitle": "Built a matrimonial website using Angular & Spring Boot",
      "year": "2024"
    },
  ];

  final List<Map<String, String>> education = [
    {
      "title": "BE Computer Science",
      "subtitle": "Mangalore Institute of Technology and Engineering",
      "year": "2021-2025"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text("Experience", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...experience.map((item) => ListTile(
              title: Text(item["title"]!),
              subtitle: Text(item["subtitle"]!),
              trailing: Text(item["year"]!),
            )),
        const SizedBox(height: 20),
        Text("Education", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...education.map((item) => ListTile(
              title: Text(item["title"]!),
              subtitle: Text(item["subtitle"]!),
              trailing: Text(item["year"]!),
            )),
      ],
    );
  }
}
