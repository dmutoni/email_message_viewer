import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:email_message_viewer/data/models/email.pb.dart';

void main() async {
  const originalBody = '''
Hello QT Team,

I am excited to apply for this opportunity at QT Global Software.
I enjoy building reliable and secure Flutter applications, and I
would love to contribute my skills while learning from your team.

Kind regards,
Denyse U.Mutoni
''';

  const tamperedBody = '''
Hello QT Team,

I am excited to apply for this opportunity at QT Global Software.
I enjoy building reliable and secure Flutter applications, and I
would love to grow into a leadership role within your company.

Kind regards,
Denyse U.Mutoni
''';

  // Load the SAME image (image stays legit)
  final imageBytes = await File(
    'helpers/sample_email_message.png',
  ).readAsBytes();

  // Compute hashes
  final bodyHash = sha256.convert(utf8.encode(originalBody)).toString();
  final imageHash = sha256.convert(imageBytes).toString();

  // Build EmailMessage
  final email = EmailMessage()
    ..senderName = 'Denyse'
    ..senderEmailAddress = 'mdenyse15@gmail.com'
    ..subject = 'Flutter Developer Application (Tampered)'
    ..body =
        tamperedBody // does NOT match hash
    ..attachedImage = imageBytes
    ..bodyHash = bodyHash
    ..imageHash = imageHash;

  // Serialize
  final bytes = email.writeToBuffer();

  // Write NON-LEGIT pb
  final output = File('assets/data/sample_email_non_legit.pb');
  await output.writeAsBytes(bytes);

  print('Non-legit sample_email_non_legit.pb generated!');
}
