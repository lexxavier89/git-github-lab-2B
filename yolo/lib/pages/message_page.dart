import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../animations/staggered_list.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  static const List<Map<String, String>> _messages = [
    {
      'name': 'Joker',
      'msg': "Let's steal their hearts!",
      'time': '9:00 AM',
      'img': 'assets/images/persona.png',
      'tag': 'Leader',
    },
    {
      'name': 'Queen',
      'msg': 'Roger that, Joker. Moving out.',
      'time': '9:02 AM',
      'img': 'assets/images/perssona1.png',
      'tag': 'Strategist',
    },
    {
      'name': 'Violet',
      'msg': 'I\'ll follow your lead, Joker!',
      'time': '9:05 AM',
      'img': 'assets/images/furper5.png',
      'tag': 'Acrobat',
    },
    {
      'name': 'Thieves',
      'msg': 'Phantom Thieves unite! Target acquired.',
      'time': '9:10 AM',
      'img': 'assets/images/fursona.png',
      'tag': 'Group',
    },
    {
      'name': 'Ops',
      'msg': 'Mission: Change their hearts.',
      'time': '9:15 AM',
      'img': 'assets/images/perferson.png',
      'tag': 'Mission',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner image at top
          Image.asset(
            'assets/images/fursona.png',
            width: double.infinity,
            height: 110,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          // Target bullseye strip
          Image.asset(
            'assets/images/persona2.png',
            width: double.infinity,
            height: 60,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: StaggeredList(
              children: _messages
                  .map((m) => _messageCard(m))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _messageCard(Map<String, String> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: AppTheme.darkRed.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            // Avatar from asset image
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(data['img']!),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        data['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.darkRed,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          data['tag']!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    data['msg']!,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              data['time']!,
              style:
                  const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
