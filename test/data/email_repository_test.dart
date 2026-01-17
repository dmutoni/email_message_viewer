import 'package:flutter_test/flutter_test.dart';
import 'package:email_message_viewer/data/repository/email_repository.dart';
import '../helpers/test_email_factory.dart';

void main() {
  late EmailRepository repository;

  setUp(() {
    repository = EmailRepositoryImpl();
  });

  test('returns true for a legit email body hash', () async {
    final email = TestEmailFactory.legitEmail();

    final result = await repository.verifyBody(email);

    expect(result, true);
  });

  test('returns false for a tampered email body hash', () async {
    final email = TestEmailFactory.nonLegitEmail();

    final result = await repository.verifyBody(email);

    expect(result, false);
  });
}
