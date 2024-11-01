/// Interface for a mail service.
abstract interface class MailService {
  /// Sends an activation letter to the specified email address with the given activation ID.
  Future<bool> sendActivationLetter({
    required String email,
    required String activationId,
  });

  /// Sends an informational letter to the specified email address.
  Future<bool> sendInformationLetter({
    required String email,
  });
}