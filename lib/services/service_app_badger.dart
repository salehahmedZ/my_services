import '../my_services.dart';

class ServiceAppBadger {
  static Future<void> updateBadgeCount(int count) async {
    try {
      if (!kIsWeb && !Platform.isMacOS) { //TODO: remove when supported
        if (await FlutterAppBadger.isAppBadgeSupported()) {
          FlutterAppBadger.updateBadgeCount(count);
        }
      }
    } on PlatformException catch (e, s) {
      logger.e(e, e, s);
    } catch (e, s) {
      logger.e(e, e, s);
    }
  }

  static void removeBadge() {
    if (!kIsWeb) {
      FlutterAppBadger.removeBadge();
    }
  }
}
