import '../my_services.dart';

part 'app_config.freezed.dart';

@freezed
class AppConfig with _$AppConfig {
  const AppConfig._();

  factory AppConfig({
    @Default(true) bool withFirebase,
    @Default(true) bool withFCM,
    @Default(true) bool withCrashlytics,
    //
    Function(Uri uri, WidgetRef ref, BuildContext context)? onDynamicLink,
    Function(String token, WidgetRef ref, BuildContext context)? onFCMTokenRefresh,
    GenerateAppTitle? onGenerateTitle,
    Function(Locale? oldLocale, Locale? newLocale, WidgetRef ref, BuildContext context)? onLocaleChange,
  }) = _AppConfig;
}