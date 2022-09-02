import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget(
      {Key? key, required this.androidBuilder, required this.iosBuilder})
      : super(key: key);

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}
