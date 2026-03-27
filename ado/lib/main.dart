import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/message_page.dart';
import 'pages/settings_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AdoApp());
}

class AdoApp extends StatelessWidget {
  const AdoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ado World',
      debugShowCheckedModeBanner: false,
      theme: AdoTheme.darkTheme,
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<_PageConfig> _pages = const [
    _PageConfig(label: 'Home',     icon: Icons.home_rounded,         page: HomePage()),
    _PageConfig(label: 'Profile',  icon: Icons.person_rounded,       page: ProfilePage()),
    _PageConfig(label: 'Messages', icon: Icons.chat_bubble_rounded,  page: MessagePage()),
    _PageConfig(label: 'Settings', icon: Icons.settings_rounded,     page: SettingsPage()),
  ];

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
    Navigator.pop(context); // close drawer
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // ── AppBar ──────────────────────────────────────────────────────────
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AdoTheme.accent, width: 2),
                image: const DecorationImage(
                  image: AssetImage('assets/images/ado2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              _pages[_currentIndex].label,
              style: theme.appBarTheme.titleTextStyle,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications_rounded,
                color: AdoTheme.accent, size: 24),
          ),
        ],
      ),

      // ── Drawer ──────────────────────────────────────────────────────────
      drawer: Drawer(
        backgroundColor: AdoTheme.surface,
        child: Column(
          children: [
            // Drawer header
            DrawerHeader(
              decoration: BoxDecoration(
                color: AdoTheme.bg,
                border: Border(
                  bottom: BorderSide(color: AdoTheme.accent.withOpacity(0.3), width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AdoTheme.accent, width: 2.5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/ado3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Ado World',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('ado@world.jp',
                      style: TextStyle(
                          color: AdoTheme.accent.withOpacity(0.7), fontSize: 12)),
                ],
              ),
            ),

            // Nav items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: List.generate(_pages.length, (i) {
                  final p = _pages[i];
                  final selected = _currentIndex == i;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: selected
                          ? AdoTheme.accent.withOpacity(0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: selected
                          ? Border.all(color: AdoTheme.accent.withOpacity(0.4))
                          : null,
                    ),
                    child: ListTile(
                      leading: Icon(p.icon,
                          color: selected ? AdoTheme.accent : Colors.white60,
                          size: 22),
                      title: Text(
                        p.label,
                        style: TextStyle(
                          color: selected ? AdoTheme.accent : Colors.white70,
                          fontWeight:
                              selected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () => _navigateTo(i),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                }),
              ),
            ),

            // Bottom of drawer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('v1.0.0',
                  style: TextStyle(
                      color: Colors.white24, fontSize: 12)),
            ),
          ],
        ),
      ),

      // ── Body ────────────────────────────────────────────────────────────
      body: IndexedStack(
        index: _currentIndex,
        children: _pages.map((p) => p.page).toList(),
      ),

      // ── Bottom Navigation Bar ───────────────────────────────────────────
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AdoTheme.accent.withOpacity(0.2), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AdoTheme.surface,
          selectedItemColor: AdoTheme.accent,
          unselectedItemColor: Colors.white38,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: _pages
              .map((p) => BottomNavigationBarItem(
                    icon: Icon(p.icon),
                    label: p.label,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

// Helper config class
class _PageConfig {
  final String label;
  final IconData icon;
  final Widget page;
  const _PageConfig(
      {required this.label, required this.icon, required this.page});
}
