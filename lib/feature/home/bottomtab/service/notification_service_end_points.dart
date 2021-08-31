enum NotificationServiceEndPoints { notifications }

extension NotificationServiceExtension on NotificationServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case NotificationServiceEndPoints.notifications:
        return 'Foreign/get_notification?token=$token';
    }
  }
}