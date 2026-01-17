import 'package:email_message_viewer/data/models/email.pb.dart';

sealed class EmailState {
  const EmailState();
}

class EmailLoading extends EmailState {
  const EmailLoading();
}

class EmailLoaded extends EmailState {
  final EmailMessage email;
  final bool isBodyVerified;
  final bool isImageVerified;

  const EmailLoaded({
    required this.email,
    required this.isBodyVerified,
    required this.isImageVerified,
  });
}

class EmailError extends EmailState {
  final String message;

  const EmailError(this.message);
}
