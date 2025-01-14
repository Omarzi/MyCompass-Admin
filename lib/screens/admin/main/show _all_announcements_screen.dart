import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mycompass_admin_website/core/constants.dart';

// Placeholder data for announcements (replace with your actual data fetching)
List<Announcement> announcements = [
  Announcement(
      title: 'إعلان رقم 1',
      content: 'هذا هو محتوى الإعلان الأول.',
      type: 'Information',
      priority: 'Normal'),
  Announcement(
      title: 'إعلان رقم 2',
      content: 'هذا هو محتوى الإعلان الثاني وهو أطول قليلاً.',
      type: 'Warning',
      priority: 'High'),
  Announcement(
      title: 'إعلان رقم 3',
      content: 'إعلان قصير.',
      type: 'Alert',
      priority: 'Low'),
  Announcement(
      title: 'إعلان رقم 4',
      content: 'هذا هو محتوى الإعلان الرابع.',
      type: 'Information',
      priority: 'Normal'),
  Announcement(
      title: 'إعلان رقم 5',
      content: 'هذا هو محتوى الإعلان الخامس وهو أطول قليلاً.',
      type: 'Warning',
      priority: 'High'),
  Announcement(
      title: 'إعلان رقم 6',
      content: 'إعلان قصير جداً.',
      type: 'Alert',
      priority: 'Low'),
];

class Announcement {
  final String title;
  final String content;
  final String type;
  final String priority;

  Announcement(
      {required this.title,
      required this.content,
      required this.type,
      required this.priority});
}

class ShowAllAnnouncementsScreen extends StatelessWidget {
  const ShowAllAnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('عرض جميع الإعلانات',
              style: Theme.of(context).textTheme.bodyLarge!),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            // Important for handling many announcements
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: announcements
                  .map(
                    (announcement) => AnnouncementCard(
                      announcement: announcement,
                      onPressedDeleteAnnouncement: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;
  final VoidCallback onPressedDeleteAnnouncement;

  const AnnouncementCard(
      {super.key,
      required this.announcement,
      required this.onPressedDeleteAnnouncement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: defaultPadding),
      // Spacing between cards
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(defaultPadding / 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                announcement.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: onPressedDeleteAnnouncement,
                icon: const Icon(
                  Iconsax.message_remove,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            announcement.content,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            'نوع الإعلان: ${announcement.type}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: defaultPadding / 2),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
            decoration: BoxDecoration(
              color: announcement.priority == 'High'
                  ? Colors.red
                  : announcement.priority == 'Low'
                      ? bgColor.withOpacity(.8)
                      : Colors.yellow.shade400,
              borderRadius: BorderRadius.circular(defaultPadding / 2),
            ),
            child: Text(
              'التصنيف: ${announcement.priority}',
              style: TextStyle(
                  color: announcement.priority == 'Normal'
                      ? Colors.black
                      : Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
