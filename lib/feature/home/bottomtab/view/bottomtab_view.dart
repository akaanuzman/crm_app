// ignore_for_file: prefer_const_constructors

import 'package:crm_app/feature/home/company/tab/view/company_tab.dart';
import 'package:crm_app/feature/home/project/tab/project_tab.dart';

import '../../../../core/components/text/subtitle1_copy.dart';
import '../viewmodel/notification_view_model.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../dashboards/view/dashboard_view.dart';

import '../../../../core/components/card/card_icon_text.dart';
import '../../../../core/components/row/row_flag_text.dart';
import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';
import '../../../../core/constants/app/app_constants.dart';

import '../../profile/viewmodel/profile/profile_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../contact/view/contact_view.dart';
import '../../mail/view/tab/view/mail_tab_view.dart';
import '../../profile/view/profile_tabbar_view.dart';
import '../model/bottomtab_model.dart';

class BottomTabView extends StatelessWidget {
  final ProfileViewModel viewModel = ProfileViewModel();
  final NotificationViewModel notificationViewModel = NotificationViewModel();
  BottomTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BottomTabModel> items = [
      BottomTabModel(
          title: "Proje", icon: Icons.assignment, child: ProjectTab()),
      BottomTabModel(
          title: "Katmanlar",
          icon: Icons.inventory_2,
          child: const DashboardView()),
      BottomTabModel(
          title: "Rehber",
          icon: Icons.contacts_sharp,
          child: const ContactView()),
      BottomTabModel(
          title: "Email", icon: Icons.email, child: const MailTabView()),
      BottomTabModel(
          title: "Şirket", icon: Icons.business, child: CompanyTab()),
    ];

    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    viewModel.fetchItems(ApplicationConstants.instance!.token, "");

    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: _buildAppBar(context, items),
        body: _buildTabBarView(items),
        drawer: _buildDrawer(context, radius),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, List<BottomTabModel> items) =>
      AppBar(
          title: Image.network(
            "http://192.168.3.53/assets/images/logo-light.png",
            width: context.dynamicWidth(0.28),
          ),
          centerTitle: true,
          bottom: _buildTabBar(items, context));

  Widget _buildDrawer(BuildContext context, double radius) => Observer(
        builder: (context) {
          return Drawer(
            child: Column(
              children: [
                Expanded(
                  child: _buildProfileContainer(context, radius),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: context.colorScheme.secondary,
                    child: Column(
                      children: [
                        _buildLanguageCard(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );

  Container _buildProfileContainer(BuildContext context, double radius) =>
      Container(
        color: context.colorScheme.background,
        child: Padding(
          padding: context.paddingLow,
          child: _buildProfileColumn(context, radius),
        ),
      );

  Column _buildProfileColumn(BuildContext context, double radius) => Column(
        children: [
          Padding(
            padding: context.paddingLow,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(viewModel.items.photo ??
                      "http://192.168.3.53/assets/images/users/user0.jpg"),
                ),
                context.emptySizedWidthBoxLow3x,
                BodyText2Copy(
                    data: viewModel.items.full_name ?? "asfsaf",
                    color: context.colorScheme.onSurface)
              ],
            ),
          ),
          context.emptySizedHeightBoxLow,
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileTabbarView()));
              },
              child: CardIconText(
                cardColor: context.colorScheme.background,
                text: "Profilim",
                icon: Icons.account_circle,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _showModalBottomSheet(context, radius, notificationViewModel);
              },
              child: CardIconText(
                cardColor: context.colorScheme.background,
                text: "Bildirimler",
                icon: Icons.notifications,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                Dio dio = Dio();
                dio.post(
                    "http://192.168.3.53/api/Foreign/log_out?token=${ApplicationConstants.instance!.token}");
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: context.colorScheme.secondaryVariant,
                    duration: context.durationSlow,
                    content: BodyText2Copy(
                      data: "Başarıyla çıkış yapıldı !",
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                );
                _showDialog(context);
              },
              child: CardIconText(
                cardColor: context.colorScheme.background,
                text: "Çıkış Yap",
                icon: Icons.exit_to_app,
              ),
            ),
          ),
        ],
      );

  Card _buildLanguageCard(BuildContext context) => Card(
        child: ExpansionTile(
          title: const RowFlagText(
            url: "http://192.168.3.53/assets/users_assets/images/flags/tr.png",
            text: "Dil",
          ),
          children: [
            _buildFlagCard(context),
          ],
        ),
      );

  SizedBox _buildFlagCard(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.25),
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: _buildFlagCardColumn,
      ),
    );
  }

  Column get _buildFlagCardColumn => Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: RowFlagText(
                url:
                    "http://192.168.3.53/assets/users_assets/images/flags/germany.jpg",
                text: "German"),
          ),
          const Expanded(
            child: RowFlagText(
                url:
                    "http://192.168.3.53/assets/users_assets/images/flags/italy.jpg",
                text: "Italian"),
          ),
          const Expanded(
            child: RowFlagText(
                url:
                    "http://192.168.3.53/assets/users_assets/images/flags/spain.jpg",
                text: "Spanish"),
          ),
          const Expanded(
            child: RowFlagText(
                url:
                    "http://192.168.3.53/assets/users_assets/images/flags/russia.jpg",
                text: "Russian"),
          ),
        ],
      );

  TabBar _buildTabBar(List<BottomTabModel> items, BuildContext context) =>
      TabBar(
        labelPadding: context.paddingLow,
        tabs: _buildTabs(items),
        indicatorColor: context.colorScheme.primary,
      );

  List<Widget> _buildTabs(List<BottomTabModel> items) => List.generate(
        items.length,
        (index) => Tab(
          text: items[index].title,
          icon: Icon(items[index].icon),
        ),
      );

  TabBarView _buildTabBarView(List<BottomTabModel> items) => TabBarView(
        children: items.map((e) => e.child).toList(),
      );

  _showModalBottomSheet(
      context, double radius, NotificationViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return Container(
          height: context.dynamicHeight(0.6),
          padding: context.paddingNormal,
          decoration: BoxDecoration(
            color: context.colorScheme.onSurface,
            borderRadius: BorderRadius.only(
              topLeft: context.highadius,
              topRight: context.highadius,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: context.dynamicWidth(0.03),
                  width: context.dynamicWidth(0.2),
                  decoration: BoxDecoration(
                      borderRadius: context.lowBorderRadius,
                      color: Colors.grey),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.paddingLow,
                child: const BodyText1Copy(data: "Bildirimler"),
              ),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.items.emails?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.65),
                  itemBuilder: (context, index) {
                    String htmlData = """
        ${viewModel.items.emails?[index].content}
        """;
                    return Padding(
                      padding: context.paddingLow,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius),
                        color: context.colorScheme.secondary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "http://192.168.3.53/assets/images/users/user0.jpg"),
                                ),
                                title: Subtitle1Copy(
                                    data: viewModel
                                            .items.emails?[index].user_name ??
                                        "")),
                            Padding(
                              padding: context.paddingNormal,
                              child: Html(
                                data: htmlData,
                              ),
                            ),
                            Center(
                                child: Text(
                                    viewModel.items.emails?[index].date ?? "")),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowValue),
        ),
        title: const BodyText1Copy(data: "Çıkış işlemi başarılı !"),
        content: const BodyText2Copy(data: "Başarıyla çıkış yapıldı."),
        actions: [
          ElevatedButton(
            child: Text("Evet",
                style: TextStyle(color: context.colorScheme.onSurface)),
            style:
                ElevatedButton.styleFrom(primary: context.colorScheme.surface),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
