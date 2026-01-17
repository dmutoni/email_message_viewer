import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:email_message_viewer/data/constants/email_assets.dart';
import 'package:email_message_viewer/data/models/email.pb.dart';
import 'package:flutter/services.dart';

abstract class EmailRepository {
  Future<EmailMessage> loadEmail();
  Future<bool> verifyBody(EmailMessage email);
  Future<bool> verifyImage(EmailMessage email);
}

class EmailRepositoryImpl implements EmailRepository {
  static const _assetPath = EmailAssets.sampleEmail;

  @override
  Future<EmailMessage> loadEmail() async {
    try {
      final byteData = await rootBundle.load(_assetPath);
      final bytes = byteData.buffer.asUint8List();
      return EmailMessage.fromBuffer(bytes);
    } catch (_) {
      throw Exception('Corrupted or invalid email file');
    }
  }

  @override
  Future<bool> verifyBody(EmailMessage email) async {
    final bodyBytes = utf8.encode(email.body);
    final computedHash = sha256.convert(bodyBytes).toString();
    return computedHash == email.bodyHash;
  }

  @override
  Future<bool> verifyImage(EmailMessage email) async {
    final imageBytes = email.attachedImage;
    final computedHash = sha256.convert(imageBytes).toString();
    return computedHash == email.imageHash;
  }
}
