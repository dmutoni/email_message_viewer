import 'dart:typed_data';

import 'package:email_message_viewer/widgets/attachment_viewer.dart';
import 'package:email_message_viewer/widgets/section_header.dart';
import 'package:email_message_viewer/widgets/verification_badges.dart';
import 'package:flutter/widgets.dart';

class EmailContent extends StatelessWidget {
  final dynamic email;
  final bool isBodyVerified;
  final bool isImageVerified;

  const EmailContent({
    super.key,
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
          Section(
            title: 'From',
            content: '${email.senderName} <${email.senderEmailAddress}>',
          ),
          const SizedBox(height: 12),
          Section(title: 'Subject', content: email.subject),
          const SizedBox(height: 16),

          if (!isBodyVerified || !isImageVerified) ...[
            Text(
              'Warning: Some parts of this email could not be verified and may be unsafe to view.',
              style: const TextStyle(
                color: Color(0xFFFF0000),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
          ] else ...[
            Row(
              children: [
                const Text(
                  'Body',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                VerificationBadge(isBodyVerified),
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
                VerificationBadge(isImageVerified),
              ],
            ),

            const SizedBox(height: 12),

            AttachmentViewer(bytes: Uint8List.fromList(email.attachedImage)),
          ],
        ],
      ),
    );
  }
}
