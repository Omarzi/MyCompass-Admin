import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AdminAddNewPostScreen extends StatefulWidget {
  const AdminAddNewPostScreen({super.key});

  @override
  State<AdminAddNewPostScreen> createState() => _AdminAddNewPostScreenState();
}

class _AdminAddNewPostScreenState extends State<AdminAddNewPostScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة منشور جديد',
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
                        'المعلومات الخاصة بالمنشور',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'عنوان المنشور',
                        hintText: 'عنوان المنشور',
                        controller: titleController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'محتوي المنشور',
                        hintText: 'محتوي المنشور',
                        controller: contentController,
                        isContent: true,
                      ),
                      const SizedBox(height: defaultPadding),

                      // Type dropdown
                      // Submit button
                      ElevatedButton(
                        onPressed: () {
                          // Handle form submission logic here
                          print('Title: ${titleController.text}');
                          print('Content: ${contentController.text}');
                        },
                        child: const Text('إضافة منشور جديد'),
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
