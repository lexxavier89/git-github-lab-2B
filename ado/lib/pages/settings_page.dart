import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = true;
  bool _autoPlay = false;
  bool _liveAlerts = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Account section ──
          _SectionLabel('Account'),
          _SettingsTile(
            icon: Icons.person_rounded,
            title: 'Edit Profile',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.lock_rounded,
            title: 'Privacy',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.security_rounded,
            title: 'Security',
            onTap: () {},
          ),

          const SizedBox(height: 20),
          _SectionLabel('Preferences'),

          _SwitchTile(
            icon: Icons.notifications_rounded,
            title: 'Notifications',
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
          ),
          _SwitchTile(
            icon: Icons.dark_mode_rounded,
            title: 'Dark Mode',
            value: _darkMode,
            onChanged: (v) => setState(() => _darkMode = v),
          ),
          _SwitchTile(
            icon: Icons.play_circle_rounded,
            title: 'Auto-Play Music',
            value: _autoPlay,
            onChanged: (v) => setState(() => _autoPlay = v),
          ),
          _SwitchTile(
            icon: Icons.live_tv_rounded,
            title: 'Live Alerts',
            value: _liveAlerts,
            onChanged: (v) => setState(() => _liveAlerts = v),
          ),

          const SizedBox(height: 20),
          _SectionLabel('About'),

          _SettingsTile(
            icon: Icons.info_rounded,
            title: 'About App',
            sub: 'v1.0.0',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.help_rounded,
            title: 'Help & Support',
            onTap: () {},
          ),

          const SizedBox(height: 24),
          // ── Sign out ──
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded, size: 18),
              label: const Text('Sign Out'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(color: Colors.redAccent),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ── Widgets ───────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: AdoTheme.accent.withOpacity(0.7),
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? sub;
  final VoidCallback onTap;

  const _SettingsTile(
      {required this.icon,
      required this.title,
      this.sub,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AdoTheme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AdoTheme.accent.withOpacity(0.1)),
      ),
      child: ListTile(
        leading: Icon(icon, color: AdoTheme.accent, size: 20),
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
        trailing: sub != null
            ? Text(sub!,
                style: const TextStyle(color: Colors.white38, fontSize: 12))
            : const Icon(Icons.chevron_right_rounded,
                color: Colors.white38, size: 20),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AdoTheme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AdoTheme.accent.withOpacity(0.1)),
      ),
      child: ListTile(
        leading: Icon(icon, color: AdoTheme.accent, size: 20),
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AdoTheme.accent,
          activeTrackColor: AdoTheme.accent.withOpacity(0.3),
          inactiveThumbColor: Colors.white38,
          inactiveTrackColor: Colors.white12,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
