import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_spot/src/controllers/home_screen_controller.dart';
import 'package:sport_spot/src/views/home/history_page.dart';
import 'package:sport_spot/src/views/home/home_page.dart';
import 'package:sport_spot/src/views/home/profile_page.dart';
import 'package:sport_spot/src/views/home/reservations_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

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
      body: Obx(() => IndexedStack(
            index: homeController.selectedIndex.value,
            children: const <Widget>[
              HomePage(),
              ReservationsPage(),
              HistoryPage(),
              ProfilePage(),
            ],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: homeController.selectedIndex.value,
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
            onTap: homeController.changePage,
          )),
    );
  }
}
