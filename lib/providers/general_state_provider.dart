import '../my_services.dart';

//------------------------------------------------------------------//

ThemeMode? watchThemeMode(WidgetRef ref) => ref.watch(generalStateProvider.select((s) => s.themeMode));

ThemeMode? readThemeMode(WidgetRef ref) => ref.read(generalStateProvider).themeMode;

bool readIsFirstAppRun(WidgetRef ref) => ref.read(generalStateProvider).isFirstAppRun;

Locale? watchLocale(WidgetRef ref) => ref.watch(generalStateProvider.select((s) => s.locale));

String? watchAppBuild(WidgetRef ref) => ref.watch(generalStateProvider.select((s) => s.appDeviceData?.appBuild));

//------------------------------------------------------------------//
GeneralStateNotifier readGeneralStateNotifier(WidgetRef ref) => ref.read(generalStateProvider.notifier);
GeneralState readGeneralState(WidgetRef ref) => ref.read(generalStateProvider);

final initialGeneralStateProvider = Provider<GeneralState>((ref) => throw UnimplementedError(''));
final generalStateProvider = StateNotifierProvider<GeneralStateNotifier, GeneralState>((ref) {
  return GeneralStateNotifier(ref.watch(initialGeneralStateProvider), ref);
});

// final generalStateProvider = StateNotifierProvider<GeneralStateNotifier, GeneralState>((ref) => GeneralStateNotifier(GeneralState(), ref));
//------------------------------------------------------------------//

class GeneralStateNotifier extends StateNotifier<GeneralState> {
  GeneralStateNotifier(GeneralState state, this.ref) : super(state);
  final Ref ref;

  Map<String, dynamic> get asMap => <String, dynamic>{
        'notification_token': state.notificationToken,
        'device_id': state.appDeviceData?.deviceID,
        'access_token': state.accessToken,
        'lang': state.locale?.languageCode,
        'appBuild': state.appDeviceData?.appBuild,
        'deviceModel': state.appDeviceData?.deviceModel,
        'deviceOSVersion': state.appDeviceData?.deviceOSVersion,
        'deviceOS': state.appDeviceData?.deviceOS,
        'themeMode': state.themeMode.toString(),
        'isFirstAppRun': state.isFirstAppRun,
        'isFirstAppBuildRun': state.isFirstAppBuildRun,
      };

  ///app
  Future<void> setAccessToken(String? value) async {
    state = state.copyWith(accessToken: value);
    await GeneralKeyValueDatabase.setAccessToken(value);
  }

  void setThemeMode(BuildContext context, ThemeMode value) {
    state = state.copyWith(themeMode: value);
    ServiceTheme.setSystemUiOverlayStyle(value, context);
    GeneralKeyValueDatabase.setThemeMode(value);
  }

  void toggleThemeMode(BuildContext context) {
    if (isDark(context)) {
      setThemeMode(context, ThemeMode.light);
    } else {
      setThemeMode(context, ThemeMode.dark);
    }
  }

  void setLocale(Locale value) {
    setLocaleWithoutSaving(value);
    GeneralKeyValueDatabase.setLocale(value);
  }

  void setLocaleWithoutSaving(Locale value) {
    state = state.copyWith(locale: value);
  }
}

Future<GeneralState> getGeneralState() async {
  logger.w('Getting GeneralState ...');

  String? notificationToken;
  String? accessToken;
  Locale? locale;
  ThemeMode? themeMode;
  bool isFirstAppRun = false;
  bool isFirstAppBuildRun = false;
  late AppDeviceData appDeviceData;

  await Future.wait<dynamic>(
    <Future<dynamic>>[
      //-----------------------------------------------------------------//
      Helpers.getApplicationDocumentsPath().then<dynamic>((_) async {
        appDeviceData = await Helpers.getAppAndDeviceData();
        //
        isFirstAppRun = await GeneralKeyValueDatabase.getIsFirstAppRun();
        isFirstAppBuildRun = await GeneralKeyValueDatabase.getIsFirstAppBuildRun(appDeviceData.appBuild);
        //
        accessToken = await GeneralKeyValueDatabase.getAccessToken();
        //
        locale = await GeneralKeyValueDatabase.getLocale();
        //
        themeMode = await GeneralKeyValueDatabase.getThemeMode();
      }),
      //-----------------------------------------------------------------//

      ServiceFirebaseMessaging.getToken().then<String?>((String? value) => notificationToken = value),

      //-----------------------------------------------------------------//
    ],
  );

  final GeneralState generalState = GeneralState(
    accessToken: accessToken,
    notificationToken: notificationToken,
    appDeviceData: appDeviceData,
    //
    locale: locale,
    themeMode: themeMode,
    //
    isFirstAppRun: isFirstAppRun,
    isFirstAppBuildRun: isFirstAppBuildRun,
  );

  return generalState;
}
