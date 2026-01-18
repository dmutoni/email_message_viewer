import 'dart:typed_data';
import 'package:email_message_viewer/data/enums/retrieval_state.dart';
import 'package:email_message_viewer/widgets/email_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/email_provider.dart';

class EmailScreen extends ConsumerWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailState = ref.watch(emailProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Secure Email Viewer')),
      body: emailState.retrievalState == RetrievalState.loading
          ? const EmailLoader()
          : emailState.retrievalState == RetrievalState.complete
          ? _EmailContent(
              email: emailState.email ?? '',
              isBodyVerified: emailState.isBodyVerified ?? false,
              isImageVerified: emailState.isImageVerified ?? false,
            )
          : Center(
              child: Text(
                emailState.errorMessage ?? 'An unknown error occurred',
                style: TextStyle(color: Colors.red),
              ),
            ),
    );
  }
}

class _EmailContent extends StatelessWidget {
  final dynamic email;
  final bool isBodyVerified;
  final bool isImageVerified;

  const _EmailContent({
    required this.email,
    required this.isBodyVerified,
    required this.isImageVerified,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Section(
            title: 'From',
            content: '${email.senderName} <${email.senderEmailAddress}>',
          ),

          const SizedBox(height: 12),

          _Section(title: 'Subject', content: email.subject),

          const SizedBox(height: 16),

          Row(
            children: [
              const Text(
                'Body',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              _VerificationBadge(isBodyVerified),
            ],
          ),

          const SizedBox(height: 8),

          Text(email.body, style: const TextStyle(fontSize: 14)),

          const SizedBox(height: 24),

          Row(
            children: [
              const Text(
                'Attachment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              _VerificationBadge(isImageVerified),
            ],
          ),

          const SizedBox(height: 12),

          _EmailImage(bytes: Uint8List.fromList(email.attachedImage)),
        ],
      ),
    );
  }
}

class _VerificationBadge extends StatelessWidget {
  final bool verified;

  const _VerificationBadge(this.verified);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        verified ? Icons.check_circle : Icons.error,
        color: Colors.white,
        size: 18,
      ),
      label: Text(
        verified ? 'Verified' : 'Failed',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: verified ? Colors.green : Colors.red,
    );
  }
}

class _EmailImage extends StatelessWidget {
  final Uint8List bytes;

  const _EmailImage({required this.bytes});

  @override
  Widget build(BuildContext context) {
    if (bytes.isEmpty) {
      return const Text('No attachment', style: TextStyle(color: Colors.grey));
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.memory(
        bytes,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) {
          return const Text(
            'Failed to load image',
            style: TextStyle(color: Colors.red),
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;

  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(content),
      ],
    );
  }
}
