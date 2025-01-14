import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_profile_header.dart';
import 'package:mycompass_admin_website/widgets/custom_drop_down_field.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  AdminProfileScreenState createState() => AdminProfileScreenState();
}

class AdminProfileScreenState extends State<AdminProfileScreen> {
  // Define controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController notificationTitleController = TextEditingController();
  final TextEditingController notificationContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdminProfileHeader(),
              const SizedBox(height: defaultPadding),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المعلومات الشخصية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
                      label: 'أدخل اسمك',
                      hintText: 'الاسم',
                      controller: userNameController,
                    ),
                    const SizedBox(height: defaultPadding),
                    CustomTextField(
                      label: 'رقم الهاتف',
                      hintText: '+20-10-XXXXXXX',
                      controller: phoneController,
                    ),
                    const SizedBox(height: defaultPadding),
                    ElevatedButton(
                      onPressed: () {
                        // Print all the form data
                        print('البريد الإلكتروني: ${emailController.text}');
                        print('اسم العائلة: ${userNameController.text}');
                        print('رقم الهاتف: ${phoneController.text}');
                      },
                      child: const Text('تحديث الملف الشخصي'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المعلومات الخاصة بالاشعارات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    CustomTextField(
                      label: 'العنوان',
                      hintText: 'هام جدا',
                      controller: emailController,
                    ),

                    const SizedBox(height: defaultPadding),
                    CustomTextField(
                      label: 'المحتوي',
                      hintText: 'الي كل مستخدمي السيستم .....',
                      controller: userNameController,
                    ),
                    const SizedBox(height: defaultPadding),
                    ElevatedButton(
                      onPressed: () {
                        // Print all the form data
                        // print('رقم الهاتف: ${phoneController.text}');
                      },
                      child: const Text('اضافة الاشعار'),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}