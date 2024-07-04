import 'package:google_map_live/notification_model.dart';

class NotificationService {
  List<NotificationModel> notifications = [];

  void sendNotification(
    String sender,
    String busRegistrationNumber,
    String message,
  ) {
    final notification = NotificationModel(
      sender: sender,
      busRegistrationNumber: busRegistrationNumber,
      message: message,
      timestamp: DateTime.now(),
    );
    notifications.add(notification);
  }

  List<NotificationModel> getNotificationsForBus(String busRegistrationNumber) {
    return notifications
        .where((notification) =>
            notification.busRegistrationNumber == busRegistrationNumber)
        .toList();
  }
}
