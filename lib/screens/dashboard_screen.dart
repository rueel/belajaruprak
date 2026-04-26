import 'package:flutter/material.dart';
import 'package:koding/models/user.dart';
import 'package:koding/screens/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late User _user;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as User;
      setState(() => _user = args);
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),

      body: _buildBody(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0: // Home
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.waving_hand, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                "Selamat datang, ${_user.name}",
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(_user.email, style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 40),
              const Text("Semangat hari ini!", style: TextStyle(fontSize: 16)),
            ],
          ),
        );

      case 1: // MENU - Recovery Tools (Grid seperti gambar)
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Recovery Tools",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text("Pilih tools yang kamu butuhkan"),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    final tools = [
                      {"title": "Urge Tracker", "desc": "Log cravings", "icon": Icons.timer, "color": Colors.red},
                      {"title": "Daily Journal", "desc": "Write your story", "icon": Icons.book, "color": Colors.orange},
                      {"title": "Community", "desc": "Talk with others", "icon": Icons.people, "color": Colors.blue},
                      {"title": "Breathing", "desc": "Calm down now", "icon": Icons.air, "color": Colors.purple},
                      {"title": "Milestones", "desc": "Track your progress", "icon": Icons.emoji_events, "color": Colors.amber},
                      {"title": "Help Now", "desc": "Emergency support", "icon": Icons.phone, "color": Colors.green},
                      {"title": "Drink Water", "desc": "Minum air setiap 2 jam", "icon": Icons.water_drop, "color": Colors.cyan},
                      {"title": "Lock Phone", "desc": "Kurangi screen time", "icon": Icons.phonelink_lock, "color": Colors.indigo},
                      {"title": "Meditation", "desc": "Meditasi 5 menit", "icon": Icons.self_improvement, "color": Colors.teal},
                      {"title": "Mood Tracker", "desc": "Catat mood harian", "icon": Icons.mood, "color": Colors.pink},
                    ];

                    final tool = tools[index];

                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: (tool["color"] as Color).withOpacity(0.3), width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              tool["icon"] as IconData,
                              size: 48,
                              color: tool["color"] as Color,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              tool["title"] as String,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              tool["desc"] as String,
                              style: const TextStyle(fontSize: 13, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );

      case 2: // Profile
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const CircleAvatar(radius: 50, backgroundColor: Colors.blue, child: Icon(Icons.person, size: 60, color: Colors.white)),
              const SizedBox(height: 30),
              const Text("Informasi Profil", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ListTile(title: const Text("Email"), subtitle: Text(_user.email)),
              const ListTile(title: Text("Password"), subtitle: Text("••••••••••")),
            ],
          ),
        );

      default:
        return const Center(child: Text("Halaman tidak ditemukan"));
    }
  }
}