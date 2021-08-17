enum MailServiceEndPoints { email,send }

extension MailServiceExtension on MailServiceEndPoints {
  String  rawValue(String token,String category) {
    switch (this) {
      case MailServiceEndPoints.email:
        return 'Email/get_incoming_email?token=$token&category=$category';
      case MailServiceEndPoints.send:
        return 'Email/get_send_email?token=$token';
    }
  }
}