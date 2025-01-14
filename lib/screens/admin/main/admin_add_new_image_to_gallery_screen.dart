import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_dashboard_header.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // To detect web platform

class AddNewImageToGalleryScreen extends StatefulWidget {
  const AddNewImageToGalleryScreen({super.key});

  @override
  State<AddNewImageToGalleryScreen> createState() =>
      _AddNewImageToGalleryScreenState();
}

class _AddNewImageToGalleryScreenState
    extends State<AddNewImageToGalleryScreen> {
  // List<File> selectedImages = [];
  final ImagePicker _picker = ImagePicker();
  List<dynamic> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إضافة صور جديدة',
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
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
              children: [
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "إضافة الصور",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton.icon(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.5,
                          vertical: defaultPadding /
                              (Responsive.isMobile(context) ? 2 : 1),
                        ),
                      ),
                      onPressed: _addImage,
                      icon: const Icon(Icons.add),
                      label: Text(
                        "إضافة الصور",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الصور المضافة",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: defaultPadding),
                      selectedImages.isNotEmpty
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: Responsive.isDesktop(context)
                                    ? 4
                                    : Responsive.isTablet(context)
                                        ? 3
                                        : 2,
                                crossAxisSpacing: defaultPadding,
                                mainAxisSpacing: defaultPadding,
                                childAspectRatio: 1,
                              ),
                              itemCount: selectedImages.length,
                              itemBuilder: (context, index) {
                                final image = selectedImages[index];

                                return Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: image is Uint8List
                                            ? Image.memory(
                                                image,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                File(image),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: IconButton(
                                        onPressed: () => _removeImage(index),
                                        icon: const Icon(
                                          Iconsax.box_remove,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                "لم يتم إضافة أي صور بعد",
                                style: TextStyle(color: Colors.grey),
                              ),
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

  void _addImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      withData: kIsWeb, // Important for web to get bytes
    );

    if (result != null) {
      if (kIsWeb) {
        // Web: Use bytes directly
        setState(() {
          selectedImages
              .addAll(result.files.map((file) => file.bytes).toList());
        });
      } else {
        // Mobile/Desktop: Use file paths
        setState(() {
          selectedImages.addAll(
              result.paths.where((path) => path != null).cast<String>());
        });
      }
    }
  }

  void _removeImage(int index) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد الحذف'),
          content: const Text('هل أنت متأكد من حذف الصورة؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog on 'No'
              },
              child: const Text('لا'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedImages.removeAt(index); // Remove image from list
                });
                Navigator.pop(context); // Close dialog on 'Yes'
                HapticFeedback.mediumImpact(); // Provide haptic feedback
              },
              child: const Text('نعم'),
            ),
          ],
        ),
      ),
    );
  }
}
