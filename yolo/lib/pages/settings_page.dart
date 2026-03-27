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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Settings banner — bullseye
          Image.asset(
            'assets/images/persona2.png',
            width: double.infinity,
            height: 110,
            fit: BoxFit.cover,
          ),

          // Perferson banner strip
          Image.asset(
            'assets/images/perferson.png',
            width: double.infinity,
            height: 70,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: StaggeredList(
              children: [
                _sectionTitle('Preferences'),
                _switchTile(
                  Icons.notifications_rounded,
                  'Notifications',
                  _notifications,
                  (v) => setState(() => _notifications = v),
                ),
                const SizedBox(height: 8),
                _switchTile(
                  Icons.dark_mode_rounded,
                  'Dark Mode',
                  _darkMode,
                  (v) => setState(() => _darkMode = v),
                ),
                const SizedBox(height: 8),
                _switchTile(
                  Icons.animation_rounded,
                  'Animations',
                  _animations,
                  (v) => setState(() => _animations = v),
                ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Size',
                              style: TextStyle(color: Colors.grey)),
                          Text(
                            '${_fontSize.toInt()} px',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                        value: _fontSize,
                        min: 10,
                        max: 24,
                        divisions: 14,
                        activeColor: AppTheme.red,
                        inactiveColor: Colors.grey.shade800,
                        onChanged: (v) =>
                            setState(() => _fontSize = v),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                _sectionTitle('Phantom Thieves'),
                // Character showcase using images
                SizedBox(
                  height: 90,
                  child: Row(
                    children: [
                      _characterThumb(
                          'assets/images/furper5.png', 'Violet'),
                      const SizedBox(width: 8),
                      _characterThumb(
                          'assets/images/perssona1.png', 'Queen'),
                      const SizedBox(width: 8),
                      _characterThumb(
                          'assets/images/persona.png', 'Joker'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                _sectionTitle('About'),
                _infoTile(
                    Icons.info_rounded, 'Version', '1.0.0'),
                const SizedBox(height: 8),
                _infoTile(
                    Icons.code_rounded, 'Developer', 'AppsDev2B Team'),
                const SizedBox(height: 8),
                _infoTile(Icons.phone_android_rounded, 'Framework',
                    'Flutter 3.x'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: AppTheme.red,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
      );

  Widget _switchTile(IconData icon, String label, bool value,
      Function(bool) onChanged) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        secondary: Icon(icon, color: AppTheme.red),
        title: Text(label,
            style: const TextStyle(color: Colors.white)),
        value: value,
        activeColor: AppTheme.red,
        onChanged: onChanged,
      ),
    );
  }

  Widget _characterThumb(String imagePath, String name) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold),
          ),
        ),
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
              style: const TextStyle(
                  color: Colors.grey, fontSize: 13)),
          const Spacer(),
          Text(value,
              style: const TextStyle(
                  color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}
