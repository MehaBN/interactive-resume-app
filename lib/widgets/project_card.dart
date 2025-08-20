import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, String> project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              project["image"]!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Title + Tech
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project["title"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project["tech"]!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),

          // View More Button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: const Text("View More"),
              onPressed: () {
                _showDetailsDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Dialog for more details
  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(project["title"]!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project["description"]!),
            const SizedBox(height: 12),
            Text("Tech Stack: ${project["tech"]}"),
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {
                final url = Uri.parse(project["link"]!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: Text(
                project["link"]!,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
