import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screen/splash/splash_controller.dart';

import '../../components/config/app_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = SplashController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Text(
              'Welcome to My App',
              textAlign: TextAlign.center,
              style: AppStyle.styleExtraBold(
                  size: 24, textColor: AppStyle.blackPure),
            ),
            const SizedBox(height: 60),
            GetBuilder<SplashController>(
                init: _controller,
                builder: (logic) {
                  if (logic.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      AppStyle.buttonPrimary(
                          width: Get.width - 32,
                          title: "Daftar",
                          onTap: () {
                            _controller.navigationToRegister();
                          }),
                      const SizedBox(height: 16),
                      AppStyle.buttonSecondary(
                          width: Get.width - 32,
                          title: "Masuk",
                          onTap: () {
                            _controller.navigationToLogin();
                          }),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
