import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_my_fields.dart';
import 'package:mycompass_admin_website/core/constants.dart';

import 'components/admin_dashboard_header.dart';
import 'components/admin_recent_files.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

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
                        MyFamilies(),
                        SizedBox(height: defaultPadding),
                        AllFamiliesTable(
                          isHome: true,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
