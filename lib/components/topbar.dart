import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Hello, John 👋",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, size: 32, color: Colors.blue),
            onPressed: () {
              // Navigate to Profile Page using GoRouter
              GoRouter.of(context).go('/profile/user-settings');
            },
          ),
        ],
      ),
    );
  }
}
