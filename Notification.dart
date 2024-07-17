class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notification> notifications = []; // List to store notifications

  @override
  void initState() {
    super.initState();
    // Simulate fetching notifications (replace with actual logic)
    notifications.add(Notification(message: "Verify your account", type: NotificationType.verification));
    // Add other notifications from the system
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationItem(notification: notification);
        },
      ),
    );
  }
}

class Notification {
  final String message;
  final NotificationType type;

  Notification({required this.message, required this.type});
}

enum NotificationType { verification, system }

class NotificationItem extends StatelessWidget {
  final Notification notification;

  const NotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(notification.type == NotificationType.verification ? Icons.verified : Icons.info),
      title: Text(notification.message),
    );
  }
}