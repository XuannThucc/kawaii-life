import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_papes.dart';
import 'themes/app_theme.dart';
import 'utils/common/logger.dart';
import 'utils/lang/translation_service.dart';


void main() {
  runApp(
      LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            ScreenUtil.init(
              constraints,
              designSize: Size(414, 896),
            );
            return MyApp();
          }
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger.info('start');
    return GetMaterialApp(
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      unknownRoute: AppPages.unknownRoute,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.fallbackLocale, //TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      // logWriterCallback: Logger.write,
    );
  }
}
