import 'package:email_message_viewer/providers/theme_provider.dart';
import 'package:email_message_viewer/screens/email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecureEmailViewerApp extends ConsumerStatefulWidget {
  const SecureEmailViewerApp({super.key});

  @override
  ConsumerState<SecureEmailViewerApp> createState() =>
      _SecureEmailViewerAppState();
}

class _SecureEmailViewerAppState extends ConsumerState<SecureEmailViewerApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);

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
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const EmailScreen(),
    );
  }
}
