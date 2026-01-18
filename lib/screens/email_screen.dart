import 'package:email_message_viewer/data/enums/retrieval_state.dart';
import 'package:email_message_viewer/providers/email_provider.dart';
import 'package:email_message_viewer/providers/theme_provider.dart';
import 'package:email_message_viewer/widgets/email_content.dart';
import 'package:email_message_viewer/widgets/email_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailScreen extends ConsumerWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailState = ref.watch(emailProvider);
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Email Viewer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: switch (emailState.retrievalState) {
        RetrievalState.loading => const EmailLoader(),
        RetrievalState.complete => EmailContent(
          email: emailState.email ?? '',
          isBodyVerified: emailState.isBodyVerified ?? false,
          isImageVerified: emailState.isImageVerified ?? false,
        ),
        _ => Center(
          child: Text(
            emailState.errorMessage ?? 'An unknown error occurred',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      },
    );
  }
}
