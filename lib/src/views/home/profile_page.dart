import 'package:flutter/material.dart';
import 'package:sport_spot/src/constants/image_strings.dart';
import 'package:sport_spot/src/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return ListView(
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
}
