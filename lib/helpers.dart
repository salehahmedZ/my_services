import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:logger/logger.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timeago/timeago.dart';

final Logger logger = Logger();

TextDirection getTextDirection(String text) => isRTL(text) ? TextDirection.rtl : TextDirection.ltr;

bool isRTL(String text) => Bidi.detectRtlDirectionality(text);

bool isLandScape(BuildContext context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final Orientation pageOrientation = mediaQueryData.orientation;
  final bool isPageOrientationLandScape = pageOrientation == Orientation.landscape;
  return isPageOrientationLandScape;
}

double getPageWidth(BuildContext context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  return mediaQueryData.size.width;
}

List<Shadow> getTextStroke(double strokeWidth, Color strokeColor) {
  return [
    // bottomLeft
    Shadow(
      offset: Offset(-strokeWidth, -strokeWidth),
      color: strokeColor,
      blurRadius: 1,
    ),
    Shadow(
      // bottomRight
      offset: Offset(strokeWidth, -strokeWidth),
      color: strokeColor,
      blurRadius: 1,
    ),
    Shadow(
      // topRight
      offset: Offset(strokeWidth, strokeWidth),
      color: strokeColor,
      blurRadius: 1,
    ),
    Shadow(
      // topLeft
      offset: Offset(-strokeWidth, strokeWidth),
      color: strokeColor,
      blurRadius: 1,
    ),
  ];
}

String indianToArabicNumbers(String text) {
  return text
      .replaceAll('٠', '0')
      .replaceAll('١', '1')
      .replaceAll('٢', '2')
      .replaceAll('٣', '3')
      .replaceAll('٤', '4')
      .replaceAll('٥', '5')
      .replaceAll('٦', '6')
      .replaceAll('٧', '7')
      .replaceAll('٨', '8')
      .replaceAll('٩', '9');
  //return text;
}

void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

bool isArabicText(String text) {
  const String arabicLetters = 'ةجحخهعغفقثصضشسيبلاتنمكورزدذطظؤآءئإأ';
  for (final String c in text.split('')) {
    if (arabicLetters.contains(c)) {
      return true;
    }
  }

  return false;
}

//////////

String getFileSize(String filepath, [int decimals = 3]) {
  final File file = File(filepath);
  final int bytes = file.lengthSync();
  if (bytes <= 0) {
    return '0 B';
  }
  const List<String> suffixes = <String>['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  final int i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

//////////

Future<void> waitForSeconds([int seconds = 2]) => Future<void>.delayed(Duration(seconds: seconds));
Future<void> waitForMilliseconds([int milliseconds = 200]) => Future<void>.delayed(Duration(milliseconds: milliseconds));

///////
Future<Directory?> _getApplicationDocumentsDirectory() async {
  if (!kIsWeb) {
    return getApplicationDocumentsDirectory();
  }
  return null;
}

String? _applicationDocumentsDirectoryPath;
bool printed = false;

Future<String?> getApplicationDocumentsPath() async {
  if (printed == false && _applicationDocumentsDirectoryPath != null) {
    logger.i(_applicationDocumentsDirectoryPath);
    printed = true;
  }
  return _applicationDocumentsDirectoryPath ??= (await _getApplicationDocumentsDirectory())?.path;
}

String getTimeAgo(String langCode, DateTime time) {
  try {
    setLocaleMessages(langCode, langCode == 'ar' ? ArMessages() : EnMessages());
    final String timeAgo = format(time, locale: langCode);
    return timeAgo;
  } catch (e) {
    logger.e(e);
  }
  return '';
}

//////

Future<PackageDeviceData> getAppAndDeviceData() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  late String deviceId;
  late String osVersion;
  late String deviceModel;

  if (Platform.isAndroid) {
    final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    deviceId = androidInfo.androidId;
    osVersion = androidInfo.version.release;
    deviceModel = androidInfo.model;
  } else if (Platform.isIOS) {
    final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
    deviceId = iosInfo.identifierForVendor;
    osVersion = iosInfo.systemVersion;
    deviceModel = iosInfo.model;
  }

  return PackageDeviceData(
    deviceID: deviceId,
    appVersion: packageInfo.version,
    appBuild: packageInfo.buildNumber,
    osVersion: osVersion,
    deviceModel: deviceModel,
  );
}

class PackageDeviceData {
  PackageDeviceData({required this.appVersion, required this.appBuild, this.deviceID, this.osVersion, this.deviceModel});

  final String appVersion;
  final String appBuild;
  final String? deviceID;
  final String? osVersion;
  final String? deviceModel;

  @override
  String toString() {
    return 'PackageDeviceData{appVersion: $appVersion, appBuild: $appBuild, deviceID: $deviceID, osVersion: $osVersion, deviceModel: $deviceModel}';
  }
}
