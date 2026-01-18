import 'package:flutter/material.dart';

class VerificationBadge extends StatelessWidget {
  final bool verified;

  const VerificationBadge(this.verified, {super.key});

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
