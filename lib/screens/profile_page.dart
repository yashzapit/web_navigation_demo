import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProfilePage extends StatelessWidget {
  final Widget child;
  ProfilePage({super.key, required this.child});

  final List<String> options = [
    'User Settings',
    'Security',
    'Personalization',
    'Referral',
    'Tools',
    'Notifications',
    'Connected Sites',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 900;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 55, vertical: 35),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            isSmallScreen
                ? Container(
                    width: 70, // Compact width for small screens
                    padding:
                        const EdgeInsets.only(left: 25,),
                    child: Column(
                      children: options.map((option) {
                        // final isSelected = GoRouter.of(context)
                        //     .routerDelegate
                        //     .currentConfiguration
                        //     .uri
                        //     .toString()
                        //     .contains(option.toLowerCase());
                        final String currentPath =
                            GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .uri
                                .path;
          
                        final isSelected =
                            isMatchingRoute(option, currentPath);
          
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                String route = getRoute(option);
                                GoRouter.of(context).go(route);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical:
                                        25.0, // Same vertical padding as in Expanded layout
                                    horizontal:
                                        5.0), // Optional: Add horizontal padding if needed
                                child: Icon(
                                  getIcon(option),
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            // Divider to match the one in expanded layout
                            Divider(
                              color: Colors.grey.shade200,
                              thickness: 1,
                              height: 12,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final option = options[index];
                        final isSelected = GoRouter.of(context)
                            .routerDelegate
                            .currentConfiguration
                            .uri
                            .toString()
                            .contains(option.toLowerCase());
          
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 20),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(
                                        vertical: 18.0,
                                        horizontal: 2.0),
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.blue
                                            .withOpacity(0.1)
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    getIcon(option),
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.black87,
                                    size: 24,
                                  ),
                                ),
                                title: Text(
                                  option,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.black87,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  String route = getRoute(option);
                                  GoRouter.of(context).go(route);
                                },
                              ),
                              if (index != options.length - 1)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 5),
                                  child: Divider(
                                    color: Colors.grey.shade200,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            VerticalDivider(
              color: Colors.grey.shade200,
              thickness: 1,
              width: 60, // Add some space between the sections
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

bool isMatchingRoute(String option, String currentPath) {
  // Normalize the current route: replace "-" with " " and make lowercase
  String normalizedPath = currentPath.toLowerCase();
  // Normalize the option: make lowercase and replace spaces with "-"
  String normalizedOption = option.toLowerCase().replaceAll(' ', '-');
  // Check if the normalized path contains the normalized option
  return normalizedPath.contains(normalizedOption);
}


IconData getIcon(String option) {
  switch (option) {
    case 'User Settings':
      return Icons.settings;
    case 'Security':
      return Icons.shield_outlined;
    case 'Personalization':
      return Icons.person;
    case 'Referral':
      return Icons.group;
    case 'Tools':
      return Icons.build;
    case 'Notifications':
      return Icons.notifications_none;
    case 'Connected Sites':
      return Icons.language;
    default:
      return Icons.settings;
  }
}

String getRoute(String option) {
  switch (option) {
    case 'User Settings':
      return '/profile/user-settings';
    case 'Security':
      return '/profile/security';
    case 'Personalization':
      return '/profile/personalization';
    case 'Referral':
      return '/profile/referral';
    case 'Tools':
      return '/profile/tools';
    case 'Notifications':
      return '/profile/notifications';
    case 'Connected Sites':
      return '/profile/connected-sites';
    default:
      return '/profile/user-settings';
  }
}

//
// User Settings Content
//
class UserSettingsContent extends StatelessWidget {
  const UserSettingsContent({super.key});

  // Widget for a clickable field with full width
Widget _clickableTile(String title, String subtitle, VoidCallback onTap) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              // Column for title and subtitle with wrapping text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      softWrap: true, // Allows the title to wrap
                      overflow: TextOverflow.visible, // Prevents truncation
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true, // Allows the subtitle to wrap
                      overflow: TextOverflow.visible, // Prevents truncation
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Divider(
          height: 1,
          color: Colors.grey.shade200,
        ),
      ),
    ],
  );
}


  // Footer Container
  Widget _footerContainer() {
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(top: 20),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,  // Aligns the text with the icon
          children: [
            Icon(Icons.info_outline, color: Colors.orange, size: 18),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Providing your email id and phone number allows you to',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                softWrap: true, // Allows the text to wrap when necessary
                overflow: TextOverflow.visible, // Ensures no truncation
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _bulletPoint('Recover your secret phrase.'),
        _bulletPoint(
            'Help your friends recognize your profile for sending & receiving funds with ease.'),
      ],
    ),
  );
}


  // Sample bullet point
static Widget _bulletPoint(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,  // Aligns the text with the icon
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 6),
        child: Icon(Icons.circle, size: 8, color: Colors.blue),
      ),
      const SizedBox(width: 8),
      Expanded(  // This ensures the text takes the remaining space and wraps when necessary
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),  // You can adjust the font size as needed
          softWrap: true,  // Allows the text to wrap
          overflow: TextOverflow.visible,  // Ensures no truncation
        ),
      ),
    ],
  );
}


  // Dialog Content
  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Dialog: $title'),
        content: const Text('This is a sample dialog with updated text data.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Adjust padding based on screen width
          double padding = constraints.maxWidth < 600 ? 15 : 25;

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
            children: [
              // Profile Header
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue[100],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Username',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'zaptuser5213',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Clickable Tiles Taking Full Width
              _clickableTile(
                'Phone Number', 
                'Click here to verify your phone number', () {
                  _showDialog(context, 'Phone Number');
                }
              ),
              _clickableTile(
                'Email Address', 
                'Click here to register your email address', () {
                  _showDialog(context, 'Email Address');
                }
              ),

              // Footer Container
              _footerContainer(),
            ],
          );
        },
      ),
    );
  }
}

//
// Security Content
//
class SecurityContent extends StatelessWidget {
  const SecurityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Security Settings Content',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
// Personalization Content
//
class PersonalizationContent extends StatelessWidget {
  const PersonalizationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Personalization Content',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
// Referral Content
//
class ReferralContent extends StatelessWidget {
  const ReferralContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Referral Content',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
// Tools Content
//
class ToolsContent extends StatelessWidget {
  const ToolsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tools Content',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
// Notifications Content
//
class NotificationsContent extends StatelessWidget {
  const NotificationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notifications Content',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//
// Connected Sites Content
//
class ConnectedSitesContent extends StatelessWidget {
  const ConnectedSitesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Connected Sites Content',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
