import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/events/event_details_screen.dart';
import 'screens/main_screen.dart';
import 'screens/organizer/add_edit_event_screen.dart';
import 'screens/organizer/organizer_dashboard_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const EventHubApp());
}

class EventHubApp extends StatelessWidget {
  const EventHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventHub',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/': (context) => const MainScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/event-details': (context) => const EventDetailsScreen(),
        '/organizer-dashboard': (context) => const OrganizerDashboardScreen(),
        '/add-edit-event': (context) => const AddEditEventScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
