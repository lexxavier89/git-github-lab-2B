import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavigate;

  const AppDrawer({
    super.key,
    required this.currentIndex,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home_rounded, 'label': 'Home', 'index': 0},
      {'icon': Icons.person_rounded, 'label': 'Profile', 'index': 1},
      {'icon': Icons.message_rounded, 'label': 'Messages', 'index': 2},
      {'icon': Icons.settings_rounded, 'label': 'Settings', 'index': 3},
    ];

    return Drawer(
      child: Column(
        children: [
          // Drawer Header with background image
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/persona.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Hero(
                    tag: 'avatar',
                    child: CircleAvatar(
                      radius: 36,
                      backgroundImage:
                          const AssetImage('assets/images/furper5.png'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'AppsDev2B',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Text(
                    'Phantom Thieves',
                    style: TextStyle(
                      color: AppTheme.red,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Nav Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                final isSelected = currentIndex == item['index'];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.red.withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(color: AppTheme.red, width: 1)
                        : null,
                  ),
                  child: ListTile(
                    leading: Icon(
                      item['icon'] as IconData,
                      color: isSelected ? AppTheme.red : Colors.grey,
                    ),
                    title: Text(
                      item['label'] as String,
                      style: TextStyle(
                        color: isSelected ? AppTheme.red : Colors.white70,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.chevron_right,
                            color: AppTheme.red, size: 18)
                        : null,
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate(item['index'] as int);
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(color: Colors.grey, height: 1),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
