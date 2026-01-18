import 'package:email_message_viewer/data/enums/retrieval_state.dart';
import 'package:email_message_viewer/data/models/email.pb.dart';
import 'package:email_message_viewer/data/repository/email_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:email_message_viewer/providers/email_provider.dart';

import '../helpers/test_email_factory.dart';

class FakeEmailRepository implements EmailRepository {
  final EmailMessage email;

  FakeEmailRepository(this.email);

  @override
  Future<EmailMessage> loadEmail() async => email;

  @override
  Future<bool> verifyBody(email) async => email.body == 'Hello QT Team';

  @override
  Future<bool> verifyImage(email) async => true;
}

void main() {
  test('loads email with verified=true for legit email', () async {
    final container = ProviderContainer(
      overrides: [
        emailRepositoryProvider.overrideWithValue(
          FakeEmailRepository(TestEmailFactory.legitEmail()),
        ),
      ],
    );

    addTearDown(container.dispose);

    // Wait for email to load
    await container.read(emailProvider.notifier).loadEmail();

    final state = container.read(emailProvider);

    expect(state.retrievalState, RetrievalState.complete);
    expect(state.email, isNotNull);
    expect(state.isBodyVerified, true);
    expect(state.isImageVerified, true);
    expect(state.errorMessage, isNull);
  });

  test(
    'loads email with verified=false for non-legit (tampered) email',
    () async {
      final container = ProviderContainer(
        overrides: [
          emailRepositoryProvider.overrideWithValue(
            FakeEmailRepository(TestEmailFactory.nonLegitEmail()),
          ),
        ],
      );

      addTearDown(container.dispose);

      // Wait for email to load
      await container.read(emailProvider.notifier).loadEmail();

      final state = container.read(emailProvider);

      expect(state.retrievalState, RetrievalState.complete);
      expect(state.email, isNotNull);
      expect(state.isBodyVerified, false); // Body integrity failed
      expect(state.isImageVerified, true); // Image integrity passes
      expect(state.errorMessage, isNull);
    },
  );

  test('handles loading state correctly', () async {
    final container = ProviderContainer(
      overrides: [
        emailRepositoryProvider.overrideWithValue(
          FakeEmailRepository(TestEmailFactory.legitEmail()),
        ),
      ],
    );

    addTearDown(container.dispose);

    // Initial state should be loading
    final initialState = container.read(emailProvider);
    expect(initialState.retrievalState, RetrievalState.loading);

    await container.read(emailProvider.notifier).loadEmail();

    final finalState = container.read(emailProvider);
    expect(finalState.retrievalState, RetrievalState.complete);
  });
}
