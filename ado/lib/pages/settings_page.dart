import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifs = true, _dark = true, _auto = false, _live = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile tile with keiko.png
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF1C2333),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF4D9FFF).withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container(
                  width: 52, height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF4D9FFF), width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/keiko.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ado Fan', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    Text('@adofan2025', style: TextStyle(color: Color(0xFF4D9FFF), fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          _label('Preferences'),
          _switchTile(Icons.notifications_rounded, 'Notifications', _notifs, (v) => setState(() => _notifs = v)),
          _switchTile(Icons.dark_mode_rounded,     'Dark Mode',     _dark,   (v) => setState(() => _dark = v)),
          _switchTile(Icons.play_circle_rounded,   'Auto-Play',     _auto,   (v) => setState(() => _auto = v)),
          _switchTile(Icons.live_tv_rounded,       'Live Alerts',   _live,   (v) => setState(() => _live = v)),
          const SizedBox(height: 16),
          _label('About'),
          _tile(Icons.info_rounded, 'About App', right: 'v1.0.0'),
          _tile(Icons.help_rounded, 'Help & Support'),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded, size: 17),
              label: const Text('Sign Out'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(color: Colors.redAccent),
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String t) => Padding(
    padding: const EdgeInsets.only(left: 4, bottom: 8),
    child: Text(t.toUpperCase(),
        style: const TextStyle(color: Color(0xFF4D9FFF), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.4)),
  );

  Widget _tile(IconData icon, String title, {String? right}) => Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(11),
      border: Border.all(color: const Color(0xFF4D9FFF).withOpacity(0.1)),
    ),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF4D9FFF), size: 20),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 13)),
      trailing: right != null
          ? Text(right, style: const TextStyle(color: Colors.white38, fontSize: 12))
          : const Icon(Icons.chevron_right_rounded, color: Colors.white38, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    ),
  );

  Widget _switchTile(IconData icon, String title, bool val, ValueChanged<bool> cb) => Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: const Color(0xFF1C2333), borderRadius: BorderRadius.circular(11),
      border: Border.all(color: const Color(0xFF4D9FFF).withOpacity(0.1)),
    ),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF4D9FFF), size: 20),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 13)),
      trailing: Switch(
        value: val, onChanged: cb,
        activeColor: const Color(0xFF4D9FFF),
        activeTrackColor: const Color(0xFF4D9FFF).withOpacity(0.3),
        inactiveThumbColor: Colors.white38,
        inactiveTrackColor: Colors.white12,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    ),
  );
}
