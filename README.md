# Secure Email Viewer (Flutter)

A small Flutter application that loads, decodes, and verifies the integrity of an email message stored in **Protocol Buffer (.pb)** format.

The app demonstrates binary data handling, Protocol Buffer decoding, and SHA-256 integrity verification using a clean Flutter + Riverpod architecture.

---

## What the App Does

On startup, the app:

1. Loads a locally stored `.pb` email file
2. Decodes it using a Protocol Buffer schema
3. Recomputes SHA-256 hashes for:
   - the email body
   - the attached image
4. Compares the computed hashes with the hashes embedded in the message
5. Displays the email content along with verification results

An email is considered **legitimate** if the recomputed hashes match the stored hashes.  
If they do not match, the email is displayed but flagged as **unverified**.

---

## Legit vs Non-Legit Emails

- **Legit email**
  - Body hash matches
  - Image hash matches
  - Displayed as **Verified**

- **Non-legit (tampered) email**
  - Content does not match stored hashes
  - Displayed with **Failed / Unverified** indicators
  - The email is still readable (not treated as corrupted)

Structural failures (missing file, invalid protobuf) are handled separately as errors.

---

## Architecture Overview

- **Flutter** for UI
- **Riverpod** for state management
- **Repository pattern** for data and verification logic
- **Protocol Buffers** for binary message serialization
- **crypto (SHA-256)** for integrity verification

Business logic is kept out of the UI and tested independently.

---

## Generating Sample `.pb` Files

Email files are generated using a small Dart script that simulates an external email producer.

- `helpers/generate_sample_email.dart` → generates a **legit** email
- `helpers/generate_non_legit_email.dart` → generates a **tampered** email

These scripts:

- define the email content and attachment
- compute SHA-256 hashes
- serialize the message into a `.pb` file placed in `assets/data/`

The Flutter app only consumes these files; it does not create or modify email data.

---

## Testing

The project includes automated tests for:

- Hash verification logic
- Legit vs non-legit email detection
- Riverpod state behavior (EmailLoaded vs EmailError)

Tests confirm that:

- hash mismatches are treated as verification failures, not exceptions
- only unreadable or corrupted files result in error states

Run tests with:

```bash
flutter test
```

Author (Denyse U.Mutoni)
