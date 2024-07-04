// notification_model.dart

class NotificationModel {
  final String sender;
  final String busRegistrationNumber;
  final String message;
  final DateTime timestamp;

  NotificationModel({
    required this.sender,
    required this.busRegistrationNumber,
    required this.message,
    required this.timestamp,
  });
}
