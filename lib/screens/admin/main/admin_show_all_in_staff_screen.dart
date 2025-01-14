import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/models/recent_employee.dart';
import 'package:mycompass_admin_website/routes/routes_name.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_dashboard_header.dart';

class AdminShowAllInStaffScreen extends StatefulWidget {
  const AdminShowAllInStaffScreen({super.key});

  @override
  State<AdminShowAllInStaffScreen> createState() =>
      _AdminShowAllInStaffScreenState();
}

class _AdminShowAllInStaffScreenState extends State<AdminShowAllInStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              AdminDashboardHeader(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyAllEmployees(),
                        SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAllEmployees extends StatelessWidget {
  const MyAllEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController horizontalScrollController = ScrollController();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "جميع الموظفين",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                print('Create');

                Navigator.pushNamed(context, RoutesName.addNewEmployee);
              },
              icon: const Icon(Icons.add),
              label: Text("إضافة موظف جديد",
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
                "جميع الموظفين",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: defaultPadding),
              LayoutBuilder(builder: (context, constraints) {
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
                      child: buildRecentEmployees(context),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildRecentEmployees(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            "الاسم",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            "البريد الإلكتروني",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            "رقم الهاتف",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text("الإجراء"), // Empty label for actions column
        ),
      ],
      rows: demoRecentEmployees.map((employee) => DataRow(cells: [
        DataCell(Row(
          children: [
            SvgPicture.asset(
              'assets/icons/menu_profile.svg',
              height: 20,
              width: 20,
              colorFilter:
              const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
            Flexible(child: Text(employee.name ?? "")),
          ],
        )),
        DataCell(Text(employee.emailAddress ?? "")),
        DataCell(Text(employee.phoneNumber ?? "")),
        DataCell(employee.widgetEditable(context)),
      ])).toList(),
    );
}
}