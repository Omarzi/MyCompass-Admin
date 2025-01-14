import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  const AddNewEmployeeScreen({super.key});

  @override
  State<AddNewEmployeeScreen> createState() => _AddNewEmployeeScreenState();
}

class _AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة موظف جديد',
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
                        'المعلومات الخاصة بالموظفين',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'أسم الموظف',
                        hintText: 'أسم الموظف',
                        controller: nameController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'البريد الإلكتروني للموظف',
                        hintText: 'البريد الإلكتروني للموظف',
                        controller: emailController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'الرقم السري للموظف',
                        hintText: 'الرقم السري للموظف',
                        controller: passwordController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'رقم واتساب الموظف',
                        hintText: 'رقم واتساب الموظف',
                        controller: phoneController,
                      ),
                      const SizedBox(height: defaultPadding),

                      // Submit button
                      ElevatedButton(
                        onPressed: () {
                          // Handle form submission logic here
                          print('Name: ${nameController.text}');
                          print('Email: ${emailController.text}');
                          print('Phone: ${phoneController.text}');
                          print('Password: ${passwordController.text}');
                        },
                        child: const Text('إضافة إعلان جديد'),
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
