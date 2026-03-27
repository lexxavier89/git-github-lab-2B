import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF4D9FFF);
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header — lulu.png as profile pic
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF111827),
              border: Border(bottom: BorderSide(color: Color(0x284D9FFF))),
            ),
            child: Column(
              children: [
                Container(
                  width: 90, height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: accent, width: 3),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/lulu.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Ado Fan',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('@adofan2025',
                    style: TextStyle(color: Color(0xFF4D9FFF), fontSize: 13)),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_rounded, size: 16),
                  label: const Text('Edit Profile'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: accent,
                    side: const BorderSide(color: accent),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
          // Gallery using all images
          Padding(
            padding: const EdgeInsets.all(14),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: const [
                _GalleryCell('assets/images/ado1.png'),
                _GalleryCell('assets/images/merry.png'),
                _GalleryCell('assets/images/keiko.png'),
                _GalleryCell('assets/images/lulu.png'),
                _GalleryCell('assets/images/naima.png'),
                _GalleryCell('assets/images/ado1.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryCell extends StatelessWidget {
  final String asset;
  const _GalleryCell(this.asset);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(asset, fit: BoxFit.cover),
    );
  }
}
