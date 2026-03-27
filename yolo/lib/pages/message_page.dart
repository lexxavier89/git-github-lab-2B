import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../animations/staggered_list.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  final List<Map<String, String>> _messages = const [
    {'name': 'Alice', 'msg': 'Hey! How are you?', 'time': '9:00 AM'},
    {'name': 'Bob', 'msg': 'Flutter is awesome!', 'time': '10:15 AM'},
    {'name': 'Carol', 'msg': 'Did you see the new update?', 'time': '11:30 AM'},
    {'name': 'Dan', 'msg': 'Let\'s meet tomorrow.', 'time': '1:00 PM'},
    {'name': 'Eve', 'msg': 'Great work on the project!', 'time': '3:45 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        StaggeredList(
          children: _messages.map((m) => _messageCard(m)).toList(),
        ),
      ],
    );
  }

  Widget _messageCard(Map<String, String> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppTheme.darkRed,
              child: Text(data['name']![0],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['name']!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(data['msg']!,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),
            Text(data['time']!,
                style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
