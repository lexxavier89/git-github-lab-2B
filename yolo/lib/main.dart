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
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/profile':
            page = Scaffold(
              backgroundColor: AppTheme.black,
              appBar: AppBar(
                title: const Text('Profile'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: const SafeArea(child: ProfilePage()),
            );
            break;
          default:
            page = const MainShell();
        }

        // Custom animated page route transition (fade + slide)
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) {
            final fade = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );
            final slide = Tween<Offset>(
              begin: const Offset(0.06, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            );
            return FadeTransition(
              opacity: fade,
              child: SlideTransition(position: slide, child: child),
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

  final List<String> _titles = [
    'Home',
    'Profile',
    'Messages',
    'Settings',
  ];

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
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
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

      // AnimatedSwitcher for page body (fade transition between tabs)
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message_rounded),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
