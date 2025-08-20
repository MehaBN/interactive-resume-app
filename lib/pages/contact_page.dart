import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final String email = "mehabakilana@gmail.com";
  final String linkedIn = "https://www.linkedin.com/in/meha-b-n-a50ab625b";
  final String github = "https://github.com/MehaBN";

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.email),
          title: Text(email),
          onTap: () => _launchURL("mailto:$email"),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("LinkedIn"),
          onTap: () => _launchURL(linkedIn),
        ),
        ListTile(
          leading: Icon(Icons.code),
          title: Text("GitHub"),
          onTap: () => _launchURL(github),
        ),
      ],
    );
  }
}
