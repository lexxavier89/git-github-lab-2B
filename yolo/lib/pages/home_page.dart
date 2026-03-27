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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full-width hero banner image
          Image.asset(
            'assets/images/perferson.png',
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: StaggeredList(
              children: [
                // Animated Container (implicit animation)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    height: _isExpanded ? 200 : 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/persona2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.55),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _isExpanded
                                  ? '▲ Tap to Collapse'
                                  : '▼ Tap to Expand',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            if (_isExpanded) ...[
                              const SizedBox(height: 10),
                              const Text(
                                'AnimatedContainer — implicit animation',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Steal their hearts!',
                                style: TextStyle(
                                    color: AppTheme.red,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // AnimatedOpacity fade card
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: _opacity,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.red),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.visibility, color: AppTheme.red, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Tap card above to fade me!',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Hero animation card — navigates to Profile
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppTheme.darkRed.withOpacity(0.5)),
                    ),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'avatar',
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: const AssetImage(
                                'assets/images/furper5.png'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Tap for Hero Animation →',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,
                            color: AppTheme.red, size: 14),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Info cards with images
                _infoImageCard(
                  'assets/images/fursona.png',
                  'Phantom Thieves',
                  'Staggered animations on page load',
                ),
                const SizedBox(height: 8),
                _infoCard(Icons.home_rounded, 'Welcome Home',
                    'Your red & black themed dashboard.'),
                const SizedBox(height: 8),
                _infoCard(Icons.animation_rounded, 'Animations',
                    'Implicit, Hero, Fade, Staggered, PageRoute.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoImageCard(
      String imagePath, String title, String subtitle) {
    return Container(
      height: 90,
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
          color: Colors.black.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
            Text(subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style:
                      const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
