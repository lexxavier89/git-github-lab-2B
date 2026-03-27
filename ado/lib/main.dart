import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/message_page.dart';
import 'pages/settings_page.dart';

void main() => runApp(const AdoApp());

class AdoApp extends StatelessWidget {
  const AdoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity1_2B',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090C14),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF111827),
          primary: Color(0xFF4D9FFF),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111827),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFFE8EDF5),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Color(0xFF4D9FFF)),
        ),
      ),
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final _labels = ['Home', 'Profile', 'Messages', 'Settings'];
  final _icons  = [
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.chat_bubble_rounded,
    Icons.settings_rounded,
  ];
  final _pages = const [
    HomePage(),
    ProfilePage(),
    MessagePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    const accent  = Color(0xFF4D9FFF);
    const bg      = Color(0xFF090C14);
    const surface = Color(0xFF111827);

    return Scaffold(
      appBar: AppBar(
        title: Text(_labels[_currentIndex]),
      ),
      drawer: Drawer(
        backgroundColor: surface,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: bg,
                border: Border(
                  bottom: BorderSide(color: Color(0x284D9FFF)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: accent, width: 2.5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/ado3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Ado Fan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const Text('ado@world.jp',
                      style: TextStyle(
                          color: Color(0xFF4D9FFF), fontSize: 12)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                itemCount: _labels.length,
                itemBuilder: (context, i) {
                  final selected = _currentIndex == i;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: selected ? accent.withOpacity(0.14) : Colors.transparent,
                      borderRadius: BorderRadius.circular(11),
                      border: selected
                          ? Border.all(color: accent.withOpacity(0.35))
                          : Border.all(color: Colors.transparent),
                    ),
                    child: ListTile(
                      leading: Icon(_icons[i],
                          color: selected ? accent : Colors.white38, size: 22),
                      title: Text(
                        _labels[i],
                        style: TextStyle(
                          color: selected ? accent : Colors.white60,
                          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        setState(() => _currentIndex = i);
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Activity1_2B · v1.0.0',
                  style: TextStyle(color: Colors.white24, fontSize: 11)),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
