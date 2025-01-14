import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/widgets/custom_drop_down_field.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AdminEditFamilyScreen extends StatefulWidget {
  const AdminEditFamilyScreen({super.key});

  @override
  State<AdminEditFamilyScreen> createState() => _AdminEditFamilyScreenState();
}

class _AdminEditFamilyScreenState extends State<AdminEditFamilyScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final theirIsDayController = TextEditingController();
  final numberOfApartmentController = TextEditingController();

  // Define selected family member
  String selectedFamilyMember = 'أب';
  String selectedTheirDay = 'Monday';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل بيانات العائلة'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Back to previous screen
            },
          ),
          backgroundColor: Colors.deepPurple, // Customize AppBar color
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            primary: false,
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        'المعلومات الخاصة بالعائلة',
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
                        label: 'اسم المستخدم',
                        hintText: 'أدخل اسم المستخدم',
                        controller: usernameController,
                      ),
                      const SizedBox(height: defaultPadding),
                      CustomTextField(
                        label: 'الرقم السري',
                        hintText: 'الرقم السري',
                        controller: passwordController,
                      ),
                      const SizedBox(height: defaultPadding),
                      CustomTextField(
                        label: 'رقم الهاتف',
                        hintText: '+20-10-XXXXXXX',
                        controller: phoneController,
                      ),
                      const SizedBox(height: defaultPadding),
                      // CustomTextField(
                      //   label: 'اليوم الخاص بهم',
                      //   hintText: 'Monday',
                      //   controller: theirIsDayController,
                      // ),
                      DropdownField(
                        label: 'أفراد الأسرة',
                        items: const [
                          'Sunday',
                          'Monday',
                          'Tuesday',
                          'Wednesday',
                          'Thursday',
                          'Friday',
                          'Saturday'
                        ],
                        selectedValue: selectedTheirDay,
                        onChanged: (value) {
                          setState(() {
                            selectedTheirDay = value;
                          });
                        },
                      ),

                      const SizedBox(height: defaultPadding),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'رقم الشقة',
                              hintText: 'أدخل رقم الشقة',
                              controller: numberOfApartmentController,
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                        ],
                      ),
                      const SizedBox(height: defaultPadding),
                      DropdownField(
                        label: 'أفراد الأسرة',
                        items: const [
                          'أب',
                          'أم',
                          'ابنة 1',
                          'ابنة 2',
                          'ابنة 3',
                          'ابن 1',
                          'ابن 2',
                          'ابن 3',
                        ],
                        selectedValue: selectedFamilyMember,
                        onChanged: (value) {
                          setState(() {
                            selectedFamilyMember = value;
                          });
                        },
                      ),
                      const SizedBox(height: defaultPadding),
                      ElevatedButton(
                        onPressed: () {
                          // Print all the form data
                          print('البريد الإلكتروني: ${emailController.text}');
                          print('رقم الهاتف: ${phoneController.text}');
                          print(
                              'رقم الشقة: ${numberOfApartmentController.text}');
                          print('فرد الأسرة: $selectedFamilyMember');
                        },
                        child: const Text('تعديل علي العائلة'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
