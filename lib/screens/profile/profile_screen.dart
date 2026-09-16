import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authService = AuthService();
  Map<String, dynamic>? _userProfile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() async {
    final user = _authService.currentUser;
    if (user != null) {
      final profile = await _authService.getUserProfile(user.uid);
      if (mounted) {
        setState(() {
          _userProfile = profile;
          _isLoading = false;
        });
      }
    } else {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = _authService.currentUser?.email ?? 'No email';
    final fullName = _userProfile?['fullName'] ?? 'Shavindi Amaya';
    final role = _userProfile?['role'] ?? 'organizer';

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    fullName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(email, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(role.toUpperCase()),
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
                    () async {
                      await _authService.signOut();
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
