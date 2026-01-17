import 'package:email_message_viewer/data/repository/email_repository.dart';
import 'package:email_message_viewer/domain/email_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final emailProvider = StateNotifierProvider<EmailNotifier, EmailState>((ref) {
  final repository = ref.read(emailRepositoryProvider);
  return EmailNotifier(repository);
});

class EmailNotifier extends StateNotifier<EmailState> {
  final EmailRepository _repository;

  EmailNotifier(this._repository) : super(const EmailLoading()) {
    loadEmail();
  }

  Future<void> loadEmail() async {
    try {
      final email = await _repository.loadEmail();

      final isBodyVerified = await _repository.verifyBody(email);
      final isImageVerified = await _repository.verifyImage(email);

      state = EmailLoaded(
        email: email,
        isBodyVerified: isBodyVerified,
        isImageVerified: isImageVerified,
      );
    } catch (e) {
      state = EmailError(e.toString());
    }
  }
}

final emailRepositoryProvider = Provider<EmailRepository>(
  (ref) => EmailRepositoryImpl(),
);
