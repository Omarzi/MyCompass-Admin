import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_dashboard_header.dart';

class AdminShowAllMaintananceScreen extends StatefulWidget {
  const AdminShowAllMaintananceScreen({super.key});

  @override
  State<AdminShowAllMaintananceScreen> createState() =>
      _AdminShowAllMaintananceScreenState();
}

class _AdminShowAllMaintananceScreenState
    extends State<AdminShowAllMaintananceScreen> {
  // List of maintenance items with dynamic status and priority
  final List<Map<String, dynamic>> maintenanceItems = [
    {
      "title": "السباكة",
      "description": "تسريب في حوض الحمام",
      "status": "قيد الانتظار",
      "statusColor": Colors.orange, // Pending
      "priority": "متوسطة",
      "priorityColor": Colors.yellow, // Medium Priority
    },
    {
      "title": "النجارة",
      "description": "إصلاح باب غرفة النوم",
      "status": "تم الأصلاح",
      "statusColor": Colors.green, // Delivered
      "priority": "عالية",
      "priorityColor": Colors.red, // High Priority
    },
    {
      "title": "الكهرباء",
      "description": "تصليح الإضاءة في الصالة",
      "status": "تم الألغاء",
      "statusColor": Colors.red, // Canceled
      "priority": "منخفضة",
      "priorityColor": Colors.green, // Low Priority
    },
  ];

  // Method to update the status and priority of a maintenance item
  void updateStatus(int index, String newStatus, Color newColor) {
    setState(() {
      maintenanceItems[index]['status'] = newStatus;
      maintenanceItems[index]['statusColor'] = newColor;
    });
  }

  void updatePriority(int index, String newPriority, Color newColor) {
    setState(() {
      maintenanceItems[index]['priority'] = newPriority;
      maintenanceItems[index]['priorityColor'] = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const AdminDashboardHeader(),
                const SizedBox(height: defaultPadding),
                Text(
                  "جميع الأصلاحات",
                  style: Theme.of(context).textTheme.titleMedium,
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
                    children: maintenanceItems
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      Map<String, dynamic> item = entry.value;
                      return Column(
                        children: [
                          MaintenanceItem(
                            title: item['title'],
                            description: item['description'],
                            statusTags: [
                              MaintenanceTag(
                                text: item['status'],
                                color: item['statusColor'],
                              ),
                              MaintenanceTag(
                                text: item['priority'],
                                color: item['priorityColor'],
                              ),
                            ],
                            onUpdateStatus: () {
                              // Example of updating the status
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => StatusUpdateDialog(
                                  onUpdate: (newStatus, newColor) {
                                    updateStatus(index, newStatus, newColor);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            onUpdatePriority: () {
                              // Example of updating the priority
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => PriorityUpdateDialog(
                                  onUpdate: (newPriority, newColor) {
                                    updatePriority(index, newPriority, newColor);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: defaultPadding),
                        ],
                      );
                    }).toList(),
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

// Dialog for updating status
class StatusUpdateDialog extends StatelessWidget {
  final Function(String, Color) onUpdate;

  const StatusUpdateDialog({super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text("قيد الانتظار"),
          onTap: () => onUpdate("قيد الانتظار", Colors.orange),
        ),
        ListTile(
          title: const Text("تم الأصلاح"),
          onTap: () => onUpdate("تم الأصلاح", Colors.green),
        ),
        ListTile(
          title: const Text("تم الألغاء"),
          onTap: () => onUpdate("تم الألغاء", Colors.red),
        ),
      ],
    );
  }
}


// Maintenance Item Component
class MaintenanceItem extends StatelessWidget {
  final String title;
  final String description;
  final List<MaintenanceTag> statusTags;
  final VoidCallback onUpdateStatus;
  final VoidCallback onUpdatePriority;

  const MaintenanceItem({
    super.key,
    required this.title,
    required this.description,
    required this.statusTags,
    required this.onUpdateStatus,
    required this.onUpdatePriority,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUpdateStatus, // Allow tapping the item to update the status
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: CupertinoColors.systemGrey4,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: statusTags.map((tag) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: tag.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag.text,
                      style: TextStyle(color: tag.color, fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              // ElevatedButton(
              //   onPressed: onUpdatePriority,
              //   child: const Text("تغيير الأولوية"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tag Component
class MaintenanceTag {
  final String text;
  final Color color;

  MaintenanceTag({required this.text, required this.color});
}

// Dialog for updating priority
class PriorityUpdateDialog extends StatelessWidget {
  final Function(String, Color) onUpdate;

  const PriorityUpdateDialog({super.key, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text("منخفضة"),
          onTap: () => onUpdate("منخفضة", Colors.green),
        ),
        ListTile(
          title: const Text("متوسطة"),
          onTap: () => onUpdate("متوسطة", Colors.yellow),
        ),
        ListTile(
          title: const Text("عالية"),
          onTap: () => onUpdate("عالية", Colors.red),
        ),
      ],
    );
  }
}
