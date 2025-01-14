import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AdminMobileLoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const AdminMobileLoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            Container(
              width: 600,
              padding: const EdgeInsets.only(
                top: defaultPadding * 2,
                left: defaultPadding * 5,
                right: defaultPadding * 5,
                bottom: defaultPadding * 2,
              ),
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(defaultPadding / 2),
              ),
              child: Column(
                children: [
                  // Image.asset("assets/images/logo.png"),
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 50,
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  const Text(
                    'المعلومات الشخصية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  CustomTextField(
                    label: 'البريد الإلكتروني',
                    hintText: 'example@gmail.com',
                    controller: emailController,
                  ),
                  const SizedBox(height: defaultPadding),
                  CustomTextField(
                    label: 'كلمة المرور',
                    hintText: '********',
                    controller: passwordController,
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      // Print all the form data
                      print('البريد الإلكتروني: ${emailController.text}');
                      print('كلمة المرور: ${passwordController.text}');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 4,
                          vertical: defaultPadding * .6),
                      child: Text('تسجيل الدخول'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
