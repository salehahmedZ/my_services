//firebaseMessaging
import '../my_services.dart';

enum FirebaseMessagingPlace {
  getInitialMessage,
  onMessageOpenedApp,
  onMessage,
}

typedef OnFirebaseNotification = Function(WidgetRef ref, RemoteMessage? message, FirebaseMessagingPlace s);

class ServiceFirebaseMessaging {
  static const ServiceFirebaseMessaging _s = ServiceFirebaseMessaging._();
  factory ServiceFirebaseMessaging() => _s;
  const ServiceFirebaseMessaging._();
  //
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<String?> getToken() => _firebaseMessaging.getToken();

  static StreamSubscription<String> onTokenRefresh(Function(String) fun) => _firebaseMessaging.onTokenRefresh.listen(fun);

  static Future<NotificationSettings> requestPermission() => _firebaseMessaging.requestPermission();

  static Future<void> registerFirebaseMessaging(WidgetRef ref, {required OnFirebaseNotification onFirebaseNotification}) async {
    final RemoteMessage? message = await _firebaseMessaging.getInitialMessage();
    await onFirebaseNotification(ref, message, FirebaseMessagingPlace.getInitialMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      onFirebaseNotification(ref, message, FirebaseMessagingPlace.onMessageOpenedApp);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      onFirebaseNotification(ref, message, FirebaseMessagingPlace.onMessage);
    });
  }
}
