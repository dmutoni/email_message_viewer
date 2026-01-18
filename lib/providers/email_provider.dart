import 'package:email_message_viewer/data/enums/retrieval_state.dart';
import 'package:email_message_viewer/data/models/email.pb.dart';
import 'package:email_message_viewer/data/repository/email_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class _EmailState {
  final EmailMessage? email;
  final bool? isBodyVerified;
  final bool? isImageVerified;
  final RetrievalState? retrievalState;
  final String? errorMessage;

  _EmailState({
    this.email,
    this.isBodyVerified,
    this.isImageVerified,
    this.retrievalState,
    this.errorMessage,
  });

  _EmailState copyWith({
    EmailMessage? email,
    bool? isBodyVerified,
    bool? isImageVerified,
    RetrievalState? retrievalState = RetrievalState.loading,
    String? errorMessage,
  }) {
    return _EmailState(
      email: email ?? this.email,
      isBodyVerified: isBodyVerified ?? this.isBodyVerified,
      isImageVerified: isImageVerified ?? this.isImageVerified,
      retrievalState: retrievalState ?? this.retrievalState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class EmailNotifier extends StateNotifier<_EmailState> {
  final EmailRepository _repository;

  EmailNotifier(this._repository)
    : super(_EmailState(retrievalState: RetrievalState.loading));

  Future<void> loadEmail() async {
    bool isBodyVerified = false;
    bool isImageVerified = false;
    EmailMessage email = await _repository.loadEmail();

    try {
      state = state.copyWith(retrievalState: RetrievalState.loading);

      isBodyVerified = await _repository.verifyBody(email);
      isImageVerified = await _repository.verifyImage(email);

      state = state.copyWith(
        email: email,
        isBodyVerified: isBodyVerified,
        isImageVerified: isImageVerified,
        retrievalState: RetrievalState.complete,
      );
    } catch (e) {
      state = state.copyWith(
        email: email,
        isBodyVerified: isBodyVerified,
        isImageVerified: isImageVerified,
        retrievalState: RetrievalState.complete,
        errorMessage: 'File corrupted or invalid.',
      );
    }
  }
}

final emailProvider = StateNotifierProvider<EmailNotifier, _EmailState>((ref) {
  final repository = ref.watch(emailRepositoryProvider);
  final notifier = EmailNotifier(repository);
  notifier.loadEmail();
  return notifier;
});

final emailRepositoryProvider = Provider<EmailRepository>(
  (ref) => EmailRepositoryImpl(),
);
