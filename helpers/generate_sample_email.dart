import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:email_message_viewer/data/models/email.pb.dart';

void main() async {
  const body = '''
Hello QT Team,

I am excited to apply for this opportunity at QT Global Software.
I enjoy building reliable and secure Flutter applications, and I
would love to contribute my skills while learning from your team.

Kind regards,
Denyse U.Mutoni
''';

  // Load the image as raw bytes
  final imageBytes = await File(
    'helpers/sample_email_message.png',
  ).readAsBytes();

  // Compute SHA-256 hashes
  final bodyHash = sha256.convert(utf8.encode(body)).toString();
  final imageHash = sha256.convert(imageBytes).toString();

  // Create the email message
  final email = EmailMessage()
    ..senderName = 'Denyse'
    ..senderEmailAddress = 'mdenyse15@gmail.com'
    ..subject = 'Flutter Developer Application'
    ..body = body
    ..attachedImage = imageBytes
    ..bodyHash = bodyHash
    ..imageHash = imageHash;

  // Serialize to binary (.pb file)
  final bytes = email.writeToBuffer();

  // Save it into assets
  final output = File('assets/data/sample_email.pb');
  await output.writeAsBytes(bytes);

  log('sample_email.pb generated successfully!');
}
