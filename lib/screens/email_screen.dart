import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/email_provider.dart';
import '../domain/email_state.dart';

class EmailScreen extends ConsumerWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emailProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Secure Email Viewer')),
      body: switch (state) {
        EmailLoading() => const Center(child: CircularProgressIndicator()),
        EmailLoaded() => const Center(child: Text('Email Loaded')),
        EmailError(:final message) => Center(child: Text(message)),
      },
    );
  }
}
