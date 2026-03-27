import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../animations/staggered_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: StaggeredList(
        children: [
          Hero(
            tag: 'avatar',
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppTheme.red,
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('John Doe',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
          const Center(
            child: Text('Flutter Developer',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ),
          const SizedBox(height: 24),
          _profileItem(Icons.email, 'Email', 'john@appsDev2B.com'),
          const SizedBox(height: 8),
          _profileItem(Icons.phone, 'Phone', '+63 912 345 6789'),
          const SizedBox(height: 8),
          _profileItem(Icons.location_on, 'Location', 'Quezon City, PH'),
          const SizedBox(height: 8),
          _profileItem(Icons.cake, 'Birthday', 'January 1, 2000'),
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
        border: Border.all(color: AppTheme.darkRed.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.red),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(value,
                style: const TextStyle(color: Colors.white, fontSize: 14)),
          ]),
        ],
      ),
    );
  }
}
