import 'dart:typed_data';

import 'package:flutter/material.dart';

class AttachmentViewer extends StatelessWidget {
  final Uint8List bytes;

  const AttachmentViewer({super.key, required this.bytes});

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
