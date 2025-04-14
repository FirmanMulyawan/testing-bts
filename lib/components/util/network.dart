import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../config/app_route.dart';
import 'storage_util.dart';

class Network {
  static Dio dioClient() {
    StorageUtil storage = Get.find();
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(seconds: 40),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true, requestHeader: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handle) async {
      final token = await storage.getToken();
      Logger().i("Current Token $token");
      if (token != null) {
        option.headers["Authorization"] = "Bearer $token";
        option.headers["Accept"] = "application/json";
      }
      return handle.next(option);
    }, onError: (error, handle) async {
      final token = await storage.getToken();
      if (error.response?.statusCode == 401 && token != null) {
        await storage.removeAll();
        await Get.offNamedUntil(AppRoute.defaultRoute, (route) => false);
      } else {
        handle.next(error);
      }
    }));
    return dio;
  }

  // / for retry usage soon
  // / if (error.response?.statusCode == 401) {
  // /         int retry = error.requestOptions.extra['retryOption'] ?? 3;
  // /         retry = retry < 0 ? 3 : retry -1;
  // /         if (retry == 0) {
  // /           return handler.next(error);
  // /         } else {
  // /           await Future.delayed(Duration(milliseconds: 300));
  // /           final token = await storage.getToken();
  // /
  // /         }
  // /       }
}

class UnauthorizedException implements Exception {}
