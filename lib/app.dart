import 'package:azelpo/config/router/router.dart';
import 'package:azelpo/config/theme/theme.dart';
import 'package:azelpo/constants/app_constants.dart';
import 'package:azelpo/constants/routes.dart';
import 'package:azelpo/providers/base_scaffold_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  // material nav key to access context
  static GlobalKey<NavigatorState> materialNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SetupFlowProvider(),
        )
      ],
      builder: (context, child) {
        kSetupFlowProvider =
            Provider.of<SetupFlowProvider>(context, listen: false);
        return MaterialApp(
          title: kAppName,
          navigatorKey: materialNavKey,
          theme: ThemeConfig.theme(),
          debugShowCheckedModeBanner: false,
          builder: (_, child) {
            return ScreenUtilInit(
              builder: () {
                return child!;
              },
            );
          },
          routes: Navigate.routes,
          initialRoute: Routes.splashScreen,
        );
      },
    );
  }
}
