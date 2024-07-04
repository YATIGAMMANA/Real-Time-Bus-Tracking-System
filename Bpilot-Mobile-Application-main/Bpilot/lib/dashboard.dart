import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_map_live/onbus.dart';
import 'package:google_map_live/pdf_viewer.dart';
import 'package:google_map_live/pilot_dashboard.dart';
import 'about_us_page.dart';
import 'help_support_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: 'User Dash Bord',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            children: [],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: _getWidgetForIndex(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 247, 224, 26),
      ),
    );
  }

  Widget _getWidgetForIndex(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const NotificationsView();
      case 2:
        return const ProfileView();
      default:
        return const Center(
          child: Text('Invalid Page'),
        );
    }
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDashboardButton(
              Icons.map,
              'Map View',
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => onbusScreen(),
                    ));
              },
            ),
            const SizedBox(width: 32), // Increase the spacing
            _buildDashboardButton(
              Icons.schedule,
              'Time Tables',
              () {
                // Navigate to timetable screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyPdfViewer(),
                    ));
              },
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDashboardButton(
              Icons.location_on,
              'Near Bus Stands',
              () {},
            ),
            const SizedBox(width: 32), // Increase the spacing
            _buildDashboardButton(
              Icons.bookmark_added_sharp,
              'Bookings',
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PilotDashboardScreen(),
                    ));
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDashboardButton(
    IconData iconData,
    String label,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: 150, // Set the width of the button
      height: 150, // Set the height of the button
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Set the border radius
          ),
          side: const BorderSide(color: Colors.black), // Add a black border
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 45, // Set the icon size
              color: Colors.black, // Set the icon color
            ),
            const SizedBox(height: 5), // Adjust the spacing
            Flexible(
              // Added Flexible widget
              child: Text(
                label,
                textAlign: TextAlign.center, // Center align the text
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Set text weight to bold
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'User Name: Developer',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Text(
            '@ All Rights recerved  ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Colors.black), // Add a black border
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpSupportPage(),
                ),
              );
            },
            child: const Text(
              'Help & Support',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Colors.black), // Add a black border
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
            child: const Text(
              'About Us',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              // Implement log out functionality here
            },
            child: const Text(
              'Log Out',
            ),
          ),
        ],
      ),
    );
  }
}
