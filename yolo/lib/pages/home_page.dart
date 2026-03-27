import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../animations/staggered_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: StaggeredList(
        children: [
          // Animated Container (implicit animation)
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: double.infinity,
              height: _isExpanded ? 180 : 100,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.darkRed, AppTheme.red],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  _isExpanded ? 'Tap to Collapse ▲' : 'Tap to Expand ▼',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // AnimatedOpacity (fade widget in/out)
          GestureDetector(
            onTap: () => setState(() => _opacity = _opacity == 1.0 ? 0.0 : 1.0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _opacity,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.red),
                ),
                child: const Text(
                  '👁 Tap the card above to fade me!',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Hero animation trigger
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profile'),
            child: Hero(
              tag: 'avatar',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppTheme.red,
                      child: const Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        Text('Tap for Hero Animation →',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          _infoCard(Icons.home, 'Welcome Home', 'This is your dashboard with all animations.'),
          const SizedBox(height: 8),
          _infoCard(Icons.star, 'Staggered', 'Cards animate in one by one on load.'),
          const SizedBox(height: 8),
          _infoCard(Icons.animation, 'Animations', 'Implicit, Hero, Fade, Page Transitions.'),
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon, String title, String subtitle) {
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ]),
        ],
      ),
    );
  }
}
