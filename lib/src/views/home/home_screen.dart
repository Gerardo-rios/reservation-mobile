import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SportSpot'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          _buildHomePage(),
          _buildReservationsPage(),
          _buildHistoryPage(),
          _buildProfilePage(authController),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          // TODO: Implement navigation between pages
        },
      ),
    );
  }

  Widget _buildHomePage() => ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search venues...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          _buildCategorySection(),
          _buildPopularVenuesSection(),
        ],
      );

  // TODO: Implement categories section
  Widget _buildCategorySection() => SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildCategoryItem('Football', Icons.sports_soccer),
            _buildCategoryItem('Basketball', Icons.sports_basketball),
            _buildCategoryItem('Tennis', Icons.sports_tennis),
            _buildCategoryItem('Swimming', Icons.pool),
          ],
        ),
      );

  Widget _buildCategoryItem(String title, IconData icon) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              child: Icon(icon, size: 30),
            ),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      );

  // TODO: Implement popular venues section
  Widget _buildPopularVenuesSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Venues',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: const Icon(Icons.place),
              title: Text('Venue ${index + 1}'),
              subtitle: const Text('Brief description of the venue'),
              trailing: ElevatedButton(
                onPressed: () {
                  // TODO: Implement booking action
                },
                child: const Text('Book'),
              ),
            ),
          ),
        ],
      );

  // TODO: Implement active bookings page
  Widget _buildReservationsPage() => const Center(child: Text('Bookings Page'));

  // TODO: Implement booking history page
  Widget _buildHistoryPage() => const Center(child: Text('Booking History'));

  Widget _buildProfilePage(AuthController authController) => ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('user@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(tAppLogo),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            onTap: () {
              // TODO: Implement profile editing
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // TODO: Implement settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // TODO: Implement help and support
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: authController.logout,
          ),
        ],
      );
}
