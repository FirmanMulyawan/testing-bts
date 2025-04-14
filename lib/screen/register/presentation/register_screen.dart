import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/base/base_view.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widgets/app_bar_widget.dart';
import 'register_controller.dart';

class RegisterScreen extends BaseView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(
        title: 'Kembali',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar',
                style: AppStyle.styleExtraBold(
                    size: 20, textColor: AppStyle.blackPure),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Daftarkan akun anda untuk menggunakan aplikasi ini.',
                style: AppStyle.styleRegular(
                    textColor: AppStyle.blackGray, size: 14),
              ),
              const SizedBox(height: 48),
              Text(
                'User Name',
                style:
                    AppStyle.styleBold(size: 14, textColor: AppStyle.blackPure),
              ),
              const SizedBox(height: 4),
              _textInputFullName(),
              const SizedBox(height: 16),
              Text(
                'Email',
                style:
                    AppStyle.styleBold(size: 14, textColor: AppStyle.blackPure),
              ),
              const SizedBox(height: 4),
              _textInputEmail(),
              const SizedBox(height: 16),
              Text(
                'Kata Sandi',
                style:
                    AppStyle.styleBold(size: 14, textColor: AppStyle.blackPure),
              ),
              const SizedBox(height: 4),
              _textInputPassword(),
              const SizedBox(height: 16),
              Text(
                'Konfirmasi Kata Sandi',
                style:
                    AppStyle.styleBold(size: 14, textColor: AppStyle.blackPure),
              ),
              const SizedBox(height: 4),
              _textInputRePassword(),
              const SizedBox(height: 40),
              AppStyle.buttonPrimary(
                  width: double.infinity,
                  hasLoading: true,
                  title: "Buat Akun",
                  onTap: () async {
                    await Future.delayed(Durations.extralong4);
                    controller.onRegister();
                  }),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: AppStyle.styleBold(
                        size: 14, textColor: AppStyle.grayDarkMore),
                  ),
                  const SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      controller.navigateToLogin();
                    },
                    child: Text(
                      'Masuk',
                      style: AppStyle.styleRegular(
                              size: 14, textColor: AppStyle.blackGray01)
                          .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInputFullName() => TextField(
        controller: controller.userNameController,
        autocorrect: true,
        style: AppStyle.styleRegular(),
        autofillHints: const [AutofillHints.name],
        decoration: AppStyle.textInputDecorator(
          hint: "Masukkan nama lengkap Anda",
        ),
      );

  Widget _textInputEmail() => TextField(
        controller: controller.emailController,
        autocorrect: true,
        style: AppStyle.styleRegular(),
        autofillHints: const [AutofillHints.email],
        decoration: AppStyle.textInputDecorator(
          hint: "Masukkan Email Anda",
        ),
      );

  Widget _textInputPassword() =>
      GetBuilder<RegisterController>(builder: (ctrl) {
        return TextField(
          style: AppStyle.styleRegular(),
          controller: controller.passwordController,
          obscureText: ctrl.isHidePassword,
          autofillHints: const [AutofillHints.password],
          decoration: AppStyle.textInputDecorator(
            iconSuffix: IconButton(
              icon: Icon(
                ctrl.isHidePassword
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

  Widget _textInputRePassword() =>
      GetBuilder<RegisterController>(builder: (ctrl) {
        return TextField(
          style: AppStyle.styleRegular(),
          controller: controller.rePasswordController,
          obscureText: ctrl.isHideRePassword,
          autofillHints: const [AutofillHints.password],
          decoration: AppStyle.textInputDecorator(
            iconSuffix: IconButton(
              icon: Icon(
                ctrl.isHideRePassword
                    ? Icons.visibility_off
                    : Icons.visibility, //change icon based on boolean value
                color: AppStyle.blackGray,
              ),
              onPressed: () {
                ctrl.updateUIRePassword();
              },
            ),
          ),
        );
      });
}
