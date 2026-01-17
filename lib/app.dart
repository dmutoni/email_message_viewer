import 'package:email_message_viewer/screens/email_screen.dart';
import 'package:flutter/material.dart';

class SecureEmailViewerApp extends StatelessWidget {
  const SecureEmailViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Email Viewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const EmailScreen(),
    );
  }
}
