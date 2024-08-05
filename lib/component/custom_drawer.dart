import 'package:flutter/material.dart';
import 'package:social/component/drawer_tile.dart';
import 'package:social/pages/settings_page.dart';
import 'package:social/services/auth/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  //access auth service

  final _auth = AuthService();

  //logout method
  void logout() {
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Icon(
                      Icons.person,
                      size: 72,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 10),
                  DrawerTile(
                    drawerIcon: Icons.home,
                    drawerTitle: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  DrawerTile(
                    drawerIcon: Icons.person,
                    drawerTitle: 'Profile',
                    onTap: () {},
                  ),
                  DrawerTile(
                    drawerIcon: Icons.search,
                    drawerTitle: 'Search',
                    onTap: () {},
                  ),
                  DrawerTile(
                    drawerIcon: Icons.settings,
                    drawerTitle: 'Settings',
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ));
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  DrawerTile(
                    drawerIcon: Icons.logout,
                    drawerTitle: 'Logout',
                    onTap: () {},
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
