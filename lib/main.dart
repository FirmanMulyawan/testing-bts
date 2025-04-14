import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'components/api/api_service.dart';
import 'components/config/app_const.dart';
import 'components/config/app_route.dart';
import 'components/config/app_style.dart';
import 'components/config/app_theme.dart';
import 'components/util/storage_util.dart';
import 'components/util/network.dart';
import 'components/services/app_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await _dependencyInjection();

  runApp(const MyApp());
}

/// ====== DI Section =====
/// Add dependency here when you need to use/available for all feature
/// ====== end =====
Future _dependencyInjection() async {
  final storage = StorageUtil(SecureStorage());
  Get.lazyPut(() => storage, fenix: true);
  Get.put(ApiService(Network.dioClient()));
  Get.put(AppService(storage));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      initialRoute: AppRoute.defaultRoute,
      theme: AppTheme.themeLight,
      unknownRoute: GetPage(
          name: AppRoute.notFound, page: () => const UnknownRoutePage()),
      getPages: AppRoute.pages,
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('No route defined for this page')),
    );
  }
}
