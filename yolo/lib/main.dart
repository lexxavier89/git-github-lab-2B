import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/app_drawer.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/message_page.dart';
import 'pages/settings_page.dart';

void main() => runApp(const AppsDev2B());

class AppsDev2B extends StatelessWidget {
  const AppsDev2B({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppsDev2B',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      // Custom Page Route Transition
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/profile':
            page = const Scaffold(
              appBar: null,
              body: SafeArea(child: ProfilePage()),
            );
            break;
          default:
            page = const MainShell();
        }
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                  parent: animation, curve: Curves.easeInOut),
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.05, 0), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.easeOut)),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
      },
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<String> _titles = ['Home', 'Profile', 'Messages', 'Settings'];
  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(),
    MessagePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(
        currentIndex: _currentIndex,
        onNavigate: (index) => setState(() => _currentIndex = index),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
