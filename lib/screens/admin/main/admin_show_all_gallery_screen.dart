import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/routes/routes_name.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_dashboard_header.dart';

class AdminShowAllGalleryScreen extends StatefulWidget {
  const AdminShowAllGalleryScreen({super.key});

  @override
  State<AdminShowAllGalleryScreen> createState() =>
      _AdminShowAllGalleryScreenState();
}

class _AdminShowAllGalleryScreenState extends State<AdminShowAllGalleryScreen> {
  List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // Added Scaffold for better structure
        body: SafeArea(
          // Added SafeArea to avoid overlaps
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const AdminDashboardHeader(),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "جميع الصور",
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
                      onPressed: () {
                        print('Create');

                        /// Todo: navigate to add new announcement screen
                        Navigator.pushNamed(
                            context, RoutesName.addNewImageToGallery);
                      },
                      icon: const Icon(Icons.add),
                      label: Text("إضافة الصور",
                          style: Theme.of(context).textTheme.bodyMedium),
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
                        "جميع الصور",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: defaultPadding),
                      GridView.builder(
                        shrinkWrap: true,
                        // Important for nested scrolling
                        physics: const NeverScrollableScrollPhysics(),
                        // Disable GridView scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Responsive.isDesktop(context)
                              ? 4
                              : Responsive.isTablet(context)
                                  ? 3
                                  : 2,
                          // Adjust count based on screen size
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio:
                              1, // Make images square (or adjust as needed)
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            // Make images tappable
                            onTap: () {
                              // Show image in a dialog or navigate to a full-screen view
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: kIsWeb
                                      ? Image.network(images[index])
                                      : Image.asset(images[index]),
                                ),
                              );
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    // Clip image to rounded corners
                                    borderRadius: BorderRadius.circular(8),
                                    child: kIsWeb
                                        ? Image.network(
                                            images[index],
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            images[index],
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: IconButton(
                                    onPressed: () => _removeItem(index),
                                    icon: Icon(
                                      Iconsax.box_remove,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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

  void _removeItem(int index) {
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
                  images.removeAt(index); // Remove image from list
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
