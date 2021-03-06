//firebaseCrashlytics
import '../my_services.dart';

class ServiceFirebaseCrashlytics {
  // static const ServiceFirebaseCrashlytics _s = ServiceFirebaseCrashlytics._();
  // factory ServiceFirebaseCrashlytics() => _s;
  // const ServiceFirebaseCrashlytics();
  //
  final FirebaseCrashlytics _firebaseCrashlytics = FirebaseCrashlytics.instance;

  Future<void> register() async {
    if (kDebugMode) {
      await _firebaseCrashlytics.setCrashlyticsCollectionEnabled(false);
    } else {
      await _firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = _firebaseCrashlytics.recordFlutterError;

      final RawReceivePort rawReceivePort = RawReceivePort((List<dynamic> errorAndStacktrace) async {
        await _firebaseCrashlytics.recordError(errorAndStacktrace.first, errorAndStacktrace.last as StackTrace);
      });

      Isolate.current.addErrorListener(rawReceivePort.sendPort);
    }
  }

  Future<void> setUserIdentifier(String identifier) async {
    if (!kIsWeb) {
      //TODO: remove when web get supported
      return _firebaseCrashlytics.setUserIdentifier(identifier);
    }
  }
}
