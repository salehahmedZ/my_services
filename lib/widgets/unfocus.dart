import '../my_services.dart';

class Unfocus extends StatelessWidget {
  const Unfocus({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        MyServices.helpers.hideKeyboard();
        MyServices.services.snackBar.hide();
      },
      child: child,
    );
  }
}
