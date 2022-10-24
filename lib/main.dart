import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/ui/layouts/main/main_layout.dart';
import 'app/ui/theme/themes.dart';
// ignore: depend_on_referenced_packages
import 'package:catcher/catcher.dart';

import 'app/ui/utils/constants/colors.dart';

//debug configuration
CatcherOptions debugOptions =
    CatcherOptions(SilentReportMode(), [ConsoleHandler()]);

//release configuration
CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
  EmailManualHandler(["ghilman6@gmail.com"])
]);

//profile configuration
CatcherOptions profileOptions =
    CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

Future<void> main() async {
  Catcher(
    runAppFunction: () async {
      WidgetsFlutterBinding.ensureInitialized();
      DependecyInjection.init();
      await dotenv.load(fileName: ".env");

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: PRIMARY_TEXT_COLOR,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      );

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then(
        (_) async {
          await initializeDateFormatting("id_ID", null);
          runApp(const MyApp());
        },
      );
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    profileConfig: profileOptions,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) {
        return GetMaterialApp(
          title: 'Ppa_mobile',
          debugShowCheckedModeBanner: false,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService.instance.themeMode,
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          initialRoute: AppRoutes.SPLASH,
          unknownRoute: AppPages.unknownRoutePage,
          getPages: AppPages.pages,
          // builder: (_, child) {
          //   return MainLayout(child: child!);
          // },
        );
      },
      //! Must change it to true if you want to use the ScreenUtil
      designSize: const Size(411, 823),
    );
  }
}
