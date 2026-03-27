import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Search bar ──
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search messages...',
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon:
                  const Icon(Icons.search_rounded, color: Colors.white38),
              filled: true,
              fillColor: AdoTheme.card,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                    color: AdoTheme.accent.withOpacity(0.5), width: 1),
              ),
            ),
          ),
        ),

        // ── Message list ──
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: _messages.length,
            separatorBuilder: (_, __) => const SizedBox(height: 2),
            itemBuilder: (context, i) {
              final m = _messages[i];
              return _MessageTile(
                name: m.$1,
                preview: m.$2,
                time: m.$3,
                unread: m.$4,
                avatarAsset: m.$5,
              );
            },
          ),
        ),
      ],
    );
  }
}

// ── Data ──────────────────────────────────────────────────────────────────
const _messages = [
  ('Ado Updates', 'New concert announced!', '9:41 AM', 2, 'assets/images/ado2.png'),
  ('Fan Club', 'Did you see the MV?', '8:20 AM', 5, 'assets/images/ado1.png'),
  ('Tour Alerts', 'Tickets on sale Friday', 'Yesterday', 0, 'assets/images/ado3.png'),
  ('Music News', 'Billboard chart update', 'Mon', 1, 'assets/images/ado2.png'),
  ('Ado Store', 'Your order has shipped', 'Sun', 0, 'assets/images/ado1.png'),
  ('Community', 'Welcome new members!', 'Sat', 3, 'assets/images/ado3.png'),
];

// ── Widget ────────────────────────────────────────────────────────────────
class _MessageTile extends StatelessWidget {
  final String name, preview, time, avatarAsset;
  final int unread;
  const _MessageTile({
    required this.name,
    required this.preview,
    required this.time,
    required this.unread,
    required this.avatarAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: unread > 0
                ? AdoTheme.accent.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: unread > 0
                          ? AdoTheme.accent
                          : Colors.white12,
                      width: 1.5),
                  image: DecorationImage(
                    image: AssetImage(avatarAsset),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: unread > 0
                                ? FontWeight.bold
                                : FontWeight.normal)),
                    const SizedBox(height: 2),
                    Text(preview,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: unread > 0
                                ? Colors.white60
                                : Colors.white38,
                            fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(time,
                      style: TextStyle(
                          color: unread > 0
                              ? AdoTheme.accent
                              : Colors.white38,
                          fontSize: 11)),
                  const SizedBox(height: 4),
                  if (unread > 0)
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: AdoTheme.accent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text('$unread',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
