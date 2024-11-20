import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

/// Interface for a mail service.
abstract interface class MailService {
  /// Sends an activation letter to the specified email address with the given activation ID.
  Future<bool> sendActivationLetter({
    required String email,
    required String activationCode,
  });
}

class MailServiceImpl implements MailService {
  MailServiceImpl({
    required this.port,
    required this.host,
    required this.login,
    required this.password,
    required this.senderName,
    required this.senderEmail,
    required this.baseUrl,
  });

  final int port;
  final String host;

  final String login;
  final String password;

  final String senderName;
  final String senderEmail;

  final String baseUrl;

  SmtpServer get getServer => SmtpServer(
        host,
        port: port,
        username: login,
        password: password,
        ignoreBadCertificate: true,
      );

  @override
  Future<bool> sendActivationLetter({
    required String email,
    required String activationCode,
  }) async {
    final message = Message()
      ..from = Address(senderEmail, senderName)
      ..recipients.add(email)
      ..subject = 'Activate your OnTime account'
      ..text =
          'Activation link for your account:$baseUrl/auth/activation/$activationCode'
      ..html = '''
    <html lang="en">
      <body style="font-family: Arial, sans-serif; color: #333;">
        <h2>Hey there!</h2>
        <p>Thanks for signing up with OnTime!</p>
        <p>Just one step left—click the button below to activate your account:</p>
        <p>
          <a href="$baseUrl/auth/activation/$activationCode" 
             style="display: inline-block; padding: 10px 20px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 5px;">
            Activate Account
          </a>
        <p>Cheers,<br>The OnTime Team</p>
      </body>
    </html>
  ''';

    try {
      final sendReport = await send(message, getServer);
      print('Sent letter: $sendReport');
      return true;
    } on MailerException catch (e) {
      print('Could not send a letter: $e');
      return false;
    }
  }
}
