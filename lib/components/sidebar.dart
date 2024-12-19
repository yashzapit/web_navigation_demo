import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Zapit',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                letterSpacing:
                    2.0, // Adjust the value for desired character spacing
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildNavigationItem(
              "Dashboard", Icons.dashboard, '/dashboard', context),
          _buildNavigationItem(
              "Profile", Icons.card_giftcard, '/profile/user-settings', context),
          _buildNavigationItem(
              "Services", Icons.miscellaneous_services, '/services', context),
          _buildNavigationItem("Tools", Icons.build, '/tools', context),
          const Divider(),
          _buildNavigationItem(
              "Rewards", Icons.card_giftcard, '/rewards', context),
          
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
      String title, IconData icon, String route, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        // Navigate to the specified route using GoRouter
        GoRouter.of(context).go(route);
      },
    );
  }
}
