import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/base/base_view.dart';
import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import 'login_controller.dart';

class LoginScreen extends BaseView<LoginController> {
  const LoginScreen({super.key});

  _safeAreaWidget(BuildContext context) {
    if (MediaQuery.of(context).viewPadding.top > 20.0) {
      return Container(
        height: 59,
        decoration: const BoxDecoration(
          color: AppStyle.bluePrimary,
          border:
              Border(bottom: BorderSide(color: AppStyle.bluePrimary, width: 0)),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Stack(children: [
                _safeAreaWidget(context),
                SizedBox(
                  width: double.infinity,
                  // color: Colors.white,
                  child: Image.asset(AppConst.imageBackground,
                      width: double.infinity),
                ),
                Column(children: [
                  SizedBox(
                    height: width / 2.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masuk',
                          style: AppStyle.styleExtraBold(
                              size: 20, textColor: AppStyle.blackPure),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Silahkan masukkan data username dan kata sandi Anda untuk masuk ke aplikasi.',
                          style: AppStyle.styleRegular(
                              textColor: AppStyle.blackGray, size: 14),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Username',
                          style: AppStyle.styleBold(
                              size: 14, textColor: AppStyle.blackPure),
                        ),
                        const SizedBox(height: 4),
                        _textInputUsername(),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Password',
                              style: AppStyle.styleBold(
                                  size: 14, textColor: AppStyle.blackPure),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                controller.navigateToForgotPassword();
                              },
                              child: Text(
                                'Lupa Kata Sandi',
                                style: AppStyle.styleRegular(
                                        size: 14, textColor: AppStyle.blackPure)
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        _textInputPassword(),
                        const SizedBox(height: 40),
                        AppStyle.buttonPrimary(
                            width: double.infinity,
                            hasLoading: true,
                            title: "Login",
                            onTap: () async {
                              await controller.onLogin();
                            }),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun?',
                              style: AppStyle.styleBold(
                                  size: 14, textColor: AppStyle.grayDarkMore),
                            ),
                            const SizedBox(width: 2),
                            GestureDetector(
                              onTap: () {
                                controller.navigateToRegister();
                              },
                              child: Text(
                                'Daftar',
                                style: AppStyle.styleRegular(
                                        size: 14,
                                        textColor: AppStyle.blackGray01)
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ])
              ]),
            )),
      ),
    );
  }

  Widget _textInputUsername() => TextField(
        controller: controller.usernameController,
        style: AppStyle.styleRegular(),
        decoration: AppStyle.textInputDecorator(
          hint: "Username",
        ),
      );

  Widget _textInputPassword() => GetBuilder<LoginController>(builder: (ctrl) {
        return TextField(
          style: AppStyle.styleRegular(),
          controller: controller.passwordController,
          obscureText: ctrl.isInvisibleVisiblePassword,
          autofillHints: const [AutofillHints.password],
          decoration: AppStyle.textInputDecorator(
            hint: "Password",
            iconSuffix: IconButton(
              icon: Icon(
                ctrl.isInvisibleVisiblePassword
                    ? Icons.visibility_off
                    : Icons.visibility, //change icon based on boolean value
                color: AppStyle.blackGray,
              ),
              onPressed: () {
                ctrl.updateUIPassword();
              },
            ),
          ),
        );
      });
}
