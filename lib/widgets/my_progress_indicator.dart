import '../my_services.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({Key? key, this.color , this.margin = EdgeInsets.zero}) : super(key: key);

  final EdgeInsets margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // if (Platform.isIOS) {
    //   return const Center(child: CupertinoActivityIndicator());
    // }
    return Center(
      child: Padding(
        padding: margin,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(getTheme(context).toggleableActiveColor),
          backgroundColor:color ?? (isDark(context) ? Colors.white : null),
        ),
      ),
    );
  }
}
