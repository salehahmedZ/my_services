import 'package:flutter_test/flutter_test.dart';
import 'package:my_services/my_services.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test AppLauncher class', (WidgetTester tester) async {
    AppLauncher appLauncher = AppLauncher(
      testing: true,
      initGeneralState: false,
      config: AppConfig(withFirebase: false),
      events: AppEvents(
        onDynamicLink: (Uri _, WidgetRef __, BuildContext ___) {},
        onFCMTokenRefresh: (String _, WidgetRef __, BuildContext ___) {},
        onGenerateTitle: (BuildContext _) => "title",
        onLocaleChange: (Locale? _, Locale? __, WidgetRef ___, BuildContext _____) {},
      ),
      //
      defaultLocale: const Locale("test1"),
      supportedLocales: [const Locale("test1"), const Locale("test2")],
      //
      // lightAccentColor: const Color(0x0f000000),
      // darkAccentColor: const Color(0xfddddddd),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );

    //locale
    expect(MyServices.services.locale.defaultLocale, const Locale("test1"));
    expect(MyServices.services.locale.supportedLocales, [const Locale("test1"), const Locale("test2")]);

    //theme
    // expect(ServiceTheme.lightAccentColor, const Color(0x0f000000));
    // expect(ServiceTheme.darkAccentColor, const Color(0xfddddddd));

    // expect(ServiceTheme.lightBgColor, const Color(0xffffffff));
    // expect(ServiceTheme.darkBgColor, const Color(0xff161b1f));
    expect(MyServices.services.theme.borderRadius, const BorderRadius.all(Radius.circular(10)));

    //appConfig + firebase
    expect(MyServices.appConfig.withFirebase, false);
    expect(MyServices.appConfig.withFCM, false);
    expect(MyServices.appConfig.withCrashlytics, false);

    //events
    expect(MyServices.appEvents.onDynamicLink != null, true);
    expect(MyServices.appEvents.onFCMTokenRefresh != null, true);
    expect(MyServices.appEvents.onGenerateTitle != null, true);
    expect(MyServices.appEvents.onLocaleChange != null, true);

    await appLauncher.prepare();

    //locale
    expect(MyServices.services.locale.defaultLocale, const Locale("test1"));
    expect(MyServices.services.locale.supportedLocales, [const Locale("test1"), const Locale("test2")]);

    //theme
    // expect(ServiceTheme.lightAccentColor, const Color(0x0f000000));
    // expect(ServiceTheme.darkAccentColor, const Color(0xfddddddd));

    // expect(ServiceTheme.lightBgColor, const Color(0xffffffff));
    // expect(ServiceTheme.darkBgColor, const Color(0xff161b1f));

    //appConfig + firebase
    expect(MyServices.appConfig.withFirebase, false);
    expect(MyServices.appConfig.withFCM, false);
    expect(MyServices.appConfig.withCrashlytics, false);

    //events
    expect(MyServices.appEvents.onDynamicLink != null, true);
    expect(MyServices.appEvents.onFCMTokenRefresh != null, true);
    expect(MyServices.appEvents.onGenerateTitle != null, true);
    expect(MyServices.appEvents.onLocaleChange != null, true);
  });
}
