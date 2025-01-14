import 'package:flutter/material.dart';
import 'package:mycompass_admin_website/core/responsive.dart';
import 'package:mycompass_admin_website/models/my_files.dart';
import 'package:mycompass_admin_website/core/constants.dart';
import 'package:mycompass_admin_website/routes/routes_name.dart';
import 'admin_file_info_card.dart';

class MyFamilies extends StatelessWidget {
  const MyFamilies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "جميع العائلات",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Responsive(
              mobile: _size.width < 450 ? ButtonsChoicesMobile() : ButtonsChoicesTabletAndDesktop(),
              tablet: _size.width < 850 ? ButtonsChoicesTabletAndDesktop() : ButtonsChoicesTabletAndDesktop(),
              desktop:  _size.width < 1400 ? ButtonsChoicesTabletAndDesktop() : ButtonsChoicesTabletAndDesktop(),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class ButtonsChoicesTabletAndDesktop extends StatelessWidget {
  const ButtonsChoicesTabletAndDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
            Navigator.pushNamed(context, RoutesName.addNewAnnouncement);
          },
          icon: const Icon(Icons.add),
          label: Text("إضافة الإعلانات",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(width: defaultPadding),
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
            Navigator.pushNamed(context, RoutesName.showAllAnnouncements);
          },
          icon: const Icon(Icons.add),
          label: Text("عرض حميع الإعلانات",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(width: defaultPadding),
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

            Navigator.pushNamed(context, RoutesName.addNewFamily);
          },
          icon: const Icon(Icons.add),
          label: Text("إضافة عائلة جديدة",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}

class ButtonsChoicesMobile extends StatelessWidget {
  const ButtonsChoicesMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

            Navigator.pushNamed(context, RoutesName.addNewFamily);
          },
          icon: const Icon(Icons.add),
          label: Text("إضافة عائلة جديدة",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(height: defaultPadding),
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
            Navigator.pushNamed(context, RoutesName.addNewAnnouncement);
          },
          icon: const Icon(Icons.add),
          label: Text("عرض حميع الإعلانات",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        const SizedBox(height: defaultPadding),
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
            Navigator.pushNamed(context, RoutesName.showAllAnnouncements);
          },
          icon: const Icon(Icons.add),
          label: Text("إضافة الإعلانات",
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          AdminFileInfoCard(info: demoMyFiles[index]),
    );
  }
}
