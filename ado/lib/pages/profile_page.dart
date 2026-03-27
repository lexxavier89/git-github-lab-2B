import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Hero banner ──
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/ado1.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AdoTheme.bg.withOpacity(0.85),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome to Ado World',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text('Explore · Connect · Listen',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),
          Text('Featured', style: tt.titleLarge),
          const SizedBox(height: 12),

          // ── Featured cards ──
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _featured.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, i) {
                final f = _featured[i];
                return _FeaturedCard(title: f.$1, sub: f.$2, icon: f.$3);
              },
            ),
          ),

          const SizedBox(height: 22),
          Text('Recent Activity', style: tt.titleLarge),
          const SizedBox(height: 12),

          // ── Activity list ──
          ...List.generate(
            _activities.length,
            (i) => _ActivityTile(
              icon: _activities[i].$1,
              title: _activities[i].$2,
              sub: _activities[i].$3,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data ──────────────────────────────────────────────────────────────────
const _featured = [
  ('New Song', 'Ado drops single', Icons.music_note_rounded),
  ('Live Tour', '2025 World Tour', Icons.stadium_rounded),
  ('Merch', 'Limited Edition', Icons.shopping_bag_rounded),
];

const _activities = [
  (Icons.headphones_rounded, 'Listened to "Show"', '2 min ago'),
  (Icons.favorite_rounded, 'Liked "Odo"', '1 hr ago'),
  (Icons.chat_bubble_rounded, 'New message from fan', '3 hrs ago'),
  (Icons.notifications_rounded, 'Concert reminder set', 'Yesterday'),
];

// ── Widgets ───────────────────────────────────────────────────────────────
class _FeaturedCard extends StatelessWidget {
  final String title, sub;
  final IconData icon;
  const _FeaturedCard(
      {required this.title, required this.sub, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AdoTheme.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AdoTheme.accent.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AdoTheme.accent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AdoTheme.accent, size: 22),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              Text(sub,
                  style: const TextStyle(
                      color: Colors.white54, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final IconData icon;
  final String title, sub;
  const _ActivityTile(
      {required this.icon, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AdoTheme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AdoTheme.accent.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AdoTheme.accent.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AdoTheme.accent, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
                Text(sub,
                    style: const TextStyle(
                        color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
