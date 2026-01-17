import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:email_message_viewer/data/models/email.pb.dart';

class TestEmailFactory {
  static EmailMessage legitEmail() {
    const body = 'Hello QT Team';

    final bodyHash = sha256.convert(utf8.encode(body)).toString();

    return EmailMessage()
      ..senderName = 'Tester'
      ..senderEmailAddress = 'test@example.com'
      ..subject = 'Legit Email'
      ..body = body
      ..attachedImage = []
      ..bodyHash = bodyHash
      ..imageHash = sha256.convert([]).toString();
  }

  static EmailMessage nonLegitEmail() {
    const originalBody = 'Hello QT Team';
    const tamperedBody = 'Hello Hacker';

    final bodyHash = sha256.convert(utf8.encode(originalBody)).toString();

    return EmailMessage()
      ..senderName = 'Tester'
      ..senderEmailAddress = 'test@example.com'
      ..subject = 'Tampered Email'
      ..body =
          tamperedBody // mismatch
      ..attachedImage = []
      ..bodyHash = bodyHash
      ..imageHash = sha256.convert([]).toString();
  }
}
