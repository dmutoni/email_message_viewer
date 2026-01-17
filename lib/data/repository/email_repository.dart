import 'package:email_message_viewer/data/models/email.pb.dart';
import 'package:flutter/services.dart';

abstract class EmailRepository {
  Future<EmailMessage> loadEmail();
  Future<bool> verifyBody(EmailMessage email);
  Future<bool> verifyImage(EmailMessage email);
}

class EmailRepositoryImpl implements EmailRepository {
  static const _assetPath = 'assets/sample_email.pb';

  @override
  Future<EmailMessage> loadEmail() async {
    try {
      final byteData = await rootBundle.load(_assetPath);

      final Uint8List bytes = byteData.buffer.asUint8List();

      final email = EmailMessage.fromBuffer(bytes);

      return email;
    } catch (e) {
      throw Exception('Failed to load email: $e');
    }
  }

  @override
  Future<bool> verifyBody(EmailMessage email) async {
    // TODO: implement in Step 3
    return false;
  }

  @override
  Future<bool> verifyImage(EmailMessage email) async {
    // TODO: implement in Step 3
    return false;
  }
}
