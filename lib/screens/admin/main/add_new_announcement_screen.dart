import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/widgets/custom_drop_down_field.dart';
import 'package:mycompass_admin_website/widgets/custom_textform_field.dart';

class AddNewAnnouncementScreen extends StatefulWidget {
  const AddNewAnnouncementScreen({super.key});

  @override
  AddNewAnnouncementScreenState createState() =>
      AddNewAnnouncementScreenState();
}

class AddNewAnnouncementScreenState extends State<AddNewAnnouncementScreen> {
  // Controllers for text fields
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  // Dropdown selections
  String selectedType = 'Information';
  String selectedPriority = 'Normal';

  // Dropdown options
  final List<String> announcementTypes = ['Information', 'Warning', 'Alert'];
  final List<String> priorities = ['Low', 'Normal', 'High'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة إعلان جديد',
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
                        'المعلومات الخاصة بالإعلان',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'عنوان الإعلان',
                        hintText: 'عنوان الإعلان',
                        controller: titleController,
                      ),
                      const SizedBox(height: defaultPadding),

                      CustomTextField(
                        label: 'محتوي الإعلان',
                        hintText: 'محتوي الإعلان',
                        controller: contentController,
                        isContent: true,
                      ),
                      const SizedBox(height: defaultPadding),

                      // Type dropdown
                      DropdownField(
                        label: 'نوع الإعلان',
                        items: announcementTypes, // Example items
                        selectedValue: selectedType,
                        onChanged: (value) {
                          setState(() {
                            selectedType = value!;
                          });
                        },
                      ),

                      const SizedBox(height: defaultPadding),

                      DropdownField(
                        label: 'التصنيف',
                        items: priorities, // Example items
                        selectedValue: selectedPriority,
                        onChanged: (value) {
                          setState(() {
                            selectedPriority = value!;
                          });
                        },
                      ),
                      const SizedBox(height: defaultPadding),

                      // Submit button
                      ElevatedButton(
                        onPressed: () {
                          // Handle form submission logic here
                          print('Title: ${titleController.text}');
                          print('Content: ${contentController.text}');
                          print('Type: $selectedType');
                          print('Priority: $selectedPriority');
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
