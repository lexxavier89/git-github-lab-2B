import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero banner — naima.png
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image.asset('assets/images/naima.png',
                    width: double.infinity, height: 200, fit: BoxFit.cover),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 14, left: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome to Ado World',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Explore · Connect · Listen',
                          style: TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Character row
          const Text('Characters',
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _CharAvatar('assets/images/merry.png',  'Merry'),
                _CharAvatar('assets/images/keiko.png',  'Keiko'),
                _CharAvatar('assets/images/lulu.png',   'Lulu'),
                _CharAvatar('assets/images/naima.png',  'Naima'),
                _CharAvatar('assets/images/ado1.png',   'Ado'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CharAvatar extends StatelessWidget {
  final String asset, name;
  const _CharAvatar(this.asset, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 58, height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF4D9FFF), width: 2),
              image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(color: Colors.white60, fontSize: 11)),
        ],
      ),
    );
  }
}
