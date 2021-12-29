import '../my_services.dart';

// ignore: prefer_function_declarations_over_variables
FormFieldValidator<String> fieldIsRequiredValidator = (String? value) {
  if (value == null || value.trim().isEmpty) {
    MyServicesLocalizationsData myServicesLabels = getMyServicesLabels(ServiceNav.navigatorKey.currentContext!);
    return myServicesLabels.thisFieldIsRequired;
  }
  return null;
};

// ignore: prefer_function_declarations_over_variables
FormFieldValidator<String> defaultEmailValidator = (String? value) {
  value = value?.trim();
  final RegExp emailRxp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  if (value == null || value.isEmpty || !emailRxp.hasMatch(value)) {
    MyServicesLocalizationsData myServicesLabels = getMyServicesLabels(ServiceNav.navigatorKey.currentContext!);
    return myServicesLabels.incorrectEmail;
  }
  return null;
};
