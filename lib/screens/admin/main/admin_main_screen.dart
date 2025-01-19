import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/managers/admin_cubit.dart';
import 'package:mycompass_admin_website/screens/admin/main/admin_profile_screen.dart';
import 'package:mycompass_admin_website/screens/admin/main/admin_room-inspections_screen.dart';
import 'package:mycompass_admin_website/screens/admin/main/admin_show_all_gallery_screen.dart';
import 'package:mycompass_admin_website/screens/admin/main/admin_show_all_maintanance_screen.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/admin_side_menu.dart';
import 'package:mycompass_admin_website/screens/admin/main/admin_dashboard_screen.dart';
import 'package:mycompass_admin_website/screens/admin/main/admin_social_media_screen.dart';
import 'package:mycompass_admin_website/screens/admin/main/components/show_all_admins_screen.dart';
import 'package:provider/provider.dart';
import 'package:mycompass_admin_website/controllers/menu_app_controller.dart';

import 'admin_show_all_in_staff_screen.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    AdminDashboardScreen(),
    AdminShowAllInStaffScreen(),
    AdminShowAllMaintananceScreen(),
    AdminShowAllGalleryScreen(),
    AdminSocialMediaScreen(),
    ShowAllAdminsScreen(),
    AdminProfileScreen(),
  ];

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: context.read<MenuAppController>().contractorOfficerScaffoldKey,
        drawer: AdminSideMenu(
          onIndexChanged: updateIndex,
          selectedIndex: selectedIndex,
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: AdminSideMenu(
                      onIndexChanged: updateIndex,
                      selectedIndex: selectedIndex),
                ),
              Expanded(
                flex: 5,
                child: IndexedStack(
                  index: selectedIndex,
                  children: screens,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
