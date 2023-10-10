import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  PlatformSettingsData webStyle(BuildContext context) {
    PlatformStyle webStyle;

    if (Theme.of(context).platform == TargetPlatform.android) {
      webStyle = PlatformStyle.Material;
    } else {
      webStyle = PlatformStyle.Cupertino;
    }

    return PlatformSettingsData(
      platformStyle: PlatformStyleData(web: webStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      tools: const [
        DeviceSection(),
      ],
      builder: (context) => PlatformProvider(
        settings: webStyle(context),
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          title: 'flutter_platform_widgets',
          home: Scaffold(
            body: Center(
              child: PlatformText('PlatformText widget'),
            ),
          ),
        ),
      ),
    );
  }
}
