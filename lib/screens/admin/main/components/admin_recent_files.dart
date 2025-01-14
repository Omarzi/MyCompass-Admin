import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/models/recent_family.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/routes/routes_name.dart';

class AllFamiliesTable extends StatelessWidget {
  const AllFamiliesTable({
    super.key, required this.isHome,
  });

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final ScrollController horizontalScrollController = ScrollController();

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "جميع العائلات",
                style: Theme.of(context).textTheme.titleMedium,
              ),

              if(isHome)  ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding /
                        (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {
                  print('Create');

                  /// Todo: navigate to add new announcement screen
                  Navigator.pushNamed(context, RoutesName.showAllRoomInspections);
                },
                icon: const Icon(Icons.add),
                label: Text(
                  "فحص الغرف",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          LayoutBuilder(
            builder: (context, constraints) {
              return Scrollbar(
                controller: horizontalScrollController,
                // Attach the same controller
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: horizontalScrollController,
                  // Attach the same controller
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                    ),
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      columns: [
                        DataColumn(
                          label: Text("أسم المستخدم",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        DataColumn(
                          label: Text("اليوم الخاص بهم",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        DataColumn(
                          label: Text("رقم الشقة",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        DataColumn(
                          label: Text("البريد الإلكتروني",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        DataColumn(
                          label: Text("رقم الهاتف",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        DataColumn(
                          label: Text(
                            "المسمي الخاص به من ضمن عائلته",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        DataColumn(
                          label: Text("الإجراء",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ],
                      rows: List.generate(
                        demoRecentCustomers.length,
                        (index) => recentCustomerDataRow(
                            demoRecentCustomers[index], context),
                      ),
                      // rows: List.generate(
                      //   demoRecentCustomers.length,
                      //       (index) =>
                      //       recentCustomerDataRow(demoRecentCustomers[index], context),
                      // ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

DataRow recentCustomerDataRow(RecentFamily fileInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 20,
              width: 20,
              colorFilter:
                  const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                fileInfo.username!,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.theirSpecialDay!)),
      DataCell(Text(fileInfo.numberOfApartment!)),
      DataCell(Text(fileInfo.emailAddress!)),
      DataCell(Text(fileInfo.phoneNumber!)),
      DataCell(Text(fileInfo.nameOfRelation!)),
      DataCell(fileInfo.widgetEditable(context)), // Pass context here
    ],
  );
}
