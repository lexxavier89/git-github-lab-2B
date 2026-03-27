import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../animations/staggered_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Group banner at top
          Image.asset(
            'assets/images/fursona.png',
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: StaggeredList(
              children: [
                // Hero avatar + name
                Column(
                  children: [
                    Hero(
                      tag: 'avatar',
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage:
                            const AssetImage('assets/images/furper5.png'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Kasumi Yoshizawa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Phantom Thief — Flutter Developer',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.darkRed,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Violet',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _profileItem(Icons.email_rounded, 'Email',
                    'kasumi@appsDev2B.com'),
                const SizedBox(height: 8),
                _profileItem(Icons.phone_rounded, 'Phone',
                    '+63 912 345 6789'),
                const SizedBox(height: 8),
                _profileItem(Icons.location_on_rounded, 'Location',
                    'Quezon City, PH'),
                const SizedBox(height: 8),
                _profileItem(
                    Icons.cake_rounded, 'Birthday', 'January 1, 2001'),
                const SizedBox(height: 16),

                // Joker card at the bottom
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/persona.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    padding: const EdgeInsets.all(14),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'I am thou, thou art I...',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileItem(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border:
            Border.all(color: AppTheme.darkRed.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.red),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style:
                      const TextStyle(color: Colors.grey, fontSize: 11)),
              Text(value,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
