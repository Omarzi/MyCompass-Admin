import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AddNewAdminScreen extends StatefulWidget {
  const AddNewAdminScreen({super.key});

  @override
  State<AddNewAdminScreen> createState() => _AddNewAdminScreenState();
}

class _AddNewAdminScreenState extends State<AddNewAdminScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة أدمن جديد',
              style: Theme.of(context).textTheme.bodyLarge!),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Back to previous screen
            },
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                        'المعلومات الخاصة بالأدمنز',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'أسم الأدمن',
                        hintText: 'أسم الأدمن',
                        controller: nameController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'البريد الإلكتروني للأدمن',
                        hintText: 'البريد الإلكتروني للأدمن',
                        controller: emailController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'كلمة المرور للأدمن',
                        hintText: 'كلمة المرور للأدمن',
                        controller: passwordController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'رقم واتساب الأدمن',
                        hintText: 'رقم واتساب الأدمن',
                        controller: phoneController,
                      ),
                      const SizedBox(height: defaultPadding),

                      // Submit button
                      ElevatedButton(
                        onPressed: () {
                          // Handle form submission logic here
                          print('Name: ${nameController.text}');
                          print('Email: ${emailController.text}');
                          print('Email: ${passwordController.text}');
                          print('Phone: ${phoneController.text}');
                        },
                        child: const Text('إضافة أدمن جديد'),
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
