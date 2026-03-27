import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../animations/staggered_list.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = true;
  bool _animations = true;
  double _fontSize = 14;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: StaggeredList(
        children: [
          _sectionTitle('Preferences'),
          _switchTile(Icons.notifications, 'Notifications', _notifications,
              (v) => setState(() => _notifications = v)),
          const SizedBox(height: 8),
          _switchTile(Icons.dark_mode, 'Dark Mode', _darkMode,
              (v) => setState(() => _darkMode = v)),
          const SizedBox(height: 8),
          _switchTile(Icons.animation, 'Animations', _animations,
              (v) => setState(() => _animations = v)),
          const SizedBox(height: 16),
          _sectionTitle('Font Size'),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text('${_fontSize.toInt()} px',
                    style: const TextStyle(color: Colors.white)),
                Slider(
                  value: _fontSize,
                  min: 10,
                  max: 24,
                  activeColor: AppTheme.red,
                  inactiveColor: Colors.grey,
                  onChanged: (v) => setState(() => _fontSize = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _sectionTitle('About'),
          _infoTile(Icons.info, 'Version', '1.0.0'),
          const SizedBox(height: 8),
          _infoTile(Icons.code, 'Developer', 'AppsDev2B Team'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title,
            style: const TextStyle(
                color: AppTheme.red,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 1.2)),
      );

  Widget _switchTile(
      IconData icon, String label, bool value, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        secondary: Icon(icon, color: AppTheme.red),
        title: Text(label, style: const TextStyle(color: Colors.white)),
        value: value,
        activeColor: AppTheme.red,
        onChanged: onChanged,
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.red),
          const SizedBox(width: 12),
          Text(label,
              style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const Spacer(),
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}
