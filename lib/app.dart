import 'package:email_message_viewer/screens/email_screen.dart';
import 'package:flutter/material.dart';

class SecureEmailViewerApp extends StatelessWidget {
  const SecureEmailViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Email Viewer',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const EmailScreen(),
    );
  }
}
