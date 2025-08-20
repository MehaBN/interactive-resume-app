import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/skills_page.dart';
import 'pages/projects_page.dart';
import 'pages/experience_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(MyResumeApp());
}

class MyResumeApp extends StatefulWidget {
  @override
  State<MyResumeApp> createState() => _MyResumeAppState();
}

class _MyResumeAppState extends State<MyResumeApp> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SkillsPage(),
    ProjectsPage(),
    ExperiencePage(),
    ContactPage(),
  ];

  final List<String> _labels = ["Home", "Skills", "Projects", "Experience", "Contact"];
  final List<IconData> _icons = [Icons.home, Icons.star, Icons.work, Icons.timeline, Icons.email];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interactive Resume",
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.redAccent,
        scaffoldBackgroundColor: Color(0xFF121212),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1F1F1F),
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.grey,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Colors.pinkAccent,
          elevation: 2,
        ),
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 600;
          bool isMobile = constraints.maxWidth <= 600;

          return Scaffold(
            appBar: isDesktop
                ? AppBar(
                    title: Text("Interactive Resume"),
                    actions: List.generate(_pages.length, (index) {
                      bool isSelected = _selectedIndex == index;
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? LinearGradient(
                                    colors: [Colors.pinkAccent, Colors.redAccent],
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () => _onItemTapped(index),
                            child: Text(
                              _labels[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                : AppBar(title: Text("Interactive Resume")),
            body: SafeArea(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: isMobile ? 300 : 500),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: _pages[_selectedIndex],
              ),
            ),
            bottomNavigationBar: !isDesktop
                ? BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    selectedItemColor: Colors.pinkAccent,
                    unselectedItemColor: Colors.grey,
                    iconSize: 24,
                    items: List.generate(_pages.length, (index) {
                      bool isSelected = _selectedIndex == index;
                      return BottomNavigationBarItem(
                        icon: AnimatedScale(
                          scale: isSelected ? 1.2 : 1.0,
                          duration: Duration(milliseconds: 150),
                          child: Icon(_icons[index]),
                        ),
                        label: _labels[index],
                      );
                    }),
                  )
                : null,
          );
        },
      ),
    );
  }
}
