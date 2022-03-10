import '../my_services.dart';

class ServiceSnackBar {
  static const ServiceSnackBar _s = ServiceSnackBar._();
  factory ServiceSnackBar() => _s;
  const ServiceSnackBar._();
  //
  static const EdgeInsets _margin = EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  fgColor(bool? success) {
    if (success == true) {
      return getColorScheme(ServiceNav.context).onTertiary;
    } else if (success == false) {
      return getColorScheme(ServiceNav.context).onError;
    }

    return getColorScheme(ServiceNav.context).onPrimary;
  }

  bgColor(bool? success) {
    if (success == true) {
      return getColorScheme(ServiceNav.context).tertiary;
    } else if (success == false) {
      return getColorScheme(ServiceNav.context).error;
    }

    return getColorScheme(ServiceNav.context).primary;
  }

  void hide() {
    ScaffoldMessenger.of(ServiceNav.context).hideCurrentSnackBar();
  }

  void showText({
    String text = '',
    bool? success,
    int seconds = 3,
    GestureTapCallback? onTap,
    bool hideShownSnackBars = false,
  }) {
    show(
      margin: _margin,
      seconds: seconds,
      hideShownSnackBars: hideShownSnackBars,
      success: success,
      content: GestureDetector(
        onTap: onTap,
        child: Text(text, textAlign: TextAlign.center, style: getTextTheme(ServiceNav.context).bodyText1?.copyWith(color: fgColor(success))),
      ),
    );
  }

  ScaffoldFeatureController? show({
    required Widget content,
    EdgeInsets margin = _margin,
    int seconds = 3,
    bool hideShownSnackBars = false,
    bool? success,
  }) {
    try {
      if (hideShownSnackBars) {
        hide();
      }

      final BuildContext context = ServiceNav.context;

      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: seconds),
          backgroundColor: bgColor(success),
          margin: margin,
          content: content,
        ),
      );
    } catch (e, s) {
      logger.e(e, e, s);
    }
    return null;
  }

  void showYesQuestion({
    String? questionText,
    String? buttonText,
    required VoidCallback onYes,
    bool hideShownSnackBars = true,
    bool? success = false,
  }) {
    show(
      success: success,
      hideShownSnackBars: hideShownSnackBars,
      content: YesSnackBarMessage(
        text: questionText,
        buttonText: buttonText,
        success: success,
        onYes: () {
          hide(); // hide myself
          onYes();
        },
      ),
    );
  }
}
