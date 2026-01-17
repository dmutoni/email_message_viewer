import 'package:email_message_viewer/data/models/email.pb.dart';
import 'package:email_message_viewer/data/repository/email_repository.dart';
import 'package:email_message_viewer/domain/email_state.dart';
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
  test('emits EmailLoaded with verified=true for legit email', () async {
    final container = ProviderContainer(
      overrides: [
        emailRepositoryProvider.overrideWithValue(
          FakeEmailRepository(TestEmailFactory.legitEmail()),
        ),
      ],
    );

    addTearDown(container.dispose);

    // Listen for state changes
    final states = <EmailState>[];
    container.listen(
      emailProvider,
      (_, next) => states.add(next),
      fireImmediately: true,
    );

    // Give async work time to complete
    await Future.delayed(Duration.zero);

    expect(states.last, isA<EmailLoaded>());
    expect((states.last as EmailLoaded).isBodyVerified, true);
  });

  test(
    'emits EmailLoaded with verified=false for non-legit (tampered) email',
    () async {
      final container = ProviderContainer(
        overrides: [
          emailRepositoryProvider.overrideWithValue(
            FakeEmailRepository(TestEmailFactory.nonLegitEmail()),
          ),
        ],
      );

      addTearDown(container.dispose);

      final states = <EmailState>[];

      container.listen(
        emailProvider,
        (_, next) => states.add(next),
        fireImmediately: true,
      );

      // Allow async loadEmail() to complete
      await Future.delayed(Duration.zero);

      // Final state should still be EmailLoaded
      expect(states.last, isA<EmailLoaded>());

      final loaded = states.last as EmailLoaded;

      // Body integrity failed
      expect(loaded.isBodyVerified, false);

      // Image integrity still passes (based on factory)
      expect(loaded.isImageVerified, true);
    },
  );
}
