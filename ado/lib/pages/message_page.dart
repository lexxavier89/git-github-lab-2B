import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  static const _msgs = [
    ('Merry',   'Hey! Did you watch the MV?',        '9:41 AM', 2, 'assets/images/merry.png'),
    ('Keiko',   'The new song slaps so hard 🔥',     '8:20 AM', 1, 'assets/images/keiko.png'),
    ('Lulu',    'Concert tickets are out!',           'Yesterday', 0, 'assets/images/lulu.png'),
    ('Naima',   'Check out this fan art I made',      'Mon', 3, 'assets/images/naima.png'),
    ('Ado Fan', 'Welcome to the fan club!',           'Sun', 0, 'assets/images/ado1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      itemCount: _msgs.length,
      itemBuilder: (context, i) {
        final m = _msgs[i];
        final unread = m.$4 > 0;
        return Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: unread ? const Color(0xFF4D9FFF).withOpacity(0.06) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 46, height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: unread ? const Color(0xFF4D9FFF) : Colors.white12,
                    width: 1.5,
                  ),
                  image: DecorationImage(image: AssetImage(m.$5), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.$1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: unread ? FontWeight.bold : FontWeight.normal,
                            fontSize: 14)),
                    Text(m.$2,
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: unread ? Colors.white54 : Colors.white30,
                            fontSize: 12)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(m.$3,
                      style: TextStyle(
                          color: unread ? const Color(0xFF4D9FFF) : Colors.white30,
                          fontSize: 11)),
                  if (unread) ...[
                    const SizedBox(height: 4),
                    Container(
                      width: 18, height: 18,
                      decoration: const BoxDecoration(
                          color: Color(0xFF4D9FFF), shape: BoxShape.circle),
                      child: Center(
                        child: Text('${m.$4}',
                            style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
