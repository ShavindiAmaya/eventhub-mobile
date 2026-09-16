import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Shavindi Amaya',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Text('shavi@gmail.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Chip(
              label: const Text('Organizer'),
              backgroundColor: Colors.deepPurple.withValues(alpha: 0.1),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(context, Icons.edit, 'Edit Profile', () {}),
            _buildProfileOption(context, Icons.notifications, 'Notifications', () {}),
            _buildProfileOption(context, Icons.security, 'Privacy & Security', () {}),
            _buildProfileOption(context, Icons.help_outline, 'Help & Support', () {}),
            const Divider(height: 32),
            _buildProfileOption(
              context,
              Icons.logout,
              'Logout',
              () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, IconData icon, String title, VoidCallback onTap, {Color? textColor}) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.deepPurple),
      title: Text(title, style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
