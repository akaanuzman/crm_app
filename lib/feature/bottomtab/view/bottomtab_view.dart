import '../../profile/view/profile_view.dart';

import '../../company/view/company_view.dart';

import '../../mail/view/mail_view.dart';

import '../../contact/view/contact_view.dart';

import '../../../core/components/card/card_icon_text.dart';
import '../../../core/components/row/row_flag_text.dart';

import '../../../product/widgets/row/row_cavatar_text.dart';

import '../../../core/init/theme/light/color_scheme_light.dart';
import '../model/bottomtab_model.dart';
import '../../project/view/project_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BottomTabView extends StatelessWidget {
  const BottomTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BottomTabModel> items = [
      BottomTabModel(
          title: "Proje", icon: Icons.assignment, child: ProjectView()),
      BottomTabModel(
          title: "Rehber",
          icon: Icons.contacts_sharp,
          child: const ContactView()),
      BottomTabModel(
          title: "Email", icon: Icons.email, child: const MailView()),
      BottomTabModel(
          title: "Şirket", icon: Icons.business, child: const CompanyView()),
    ];

    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: _buildAppBar(context, items),
        body: _buildTabBarView(items),
        drawer: _buildDrawer(context),
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

  Drawer _buildDrawer(BuildContext context) => Drawer(
        child: Column(
          children: [
            Expanded(
              child: _buildProfileContainer(context),
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

  Container _buildProfileContainer(BuildContext context) => Container(
        color: ColorSchemeLight.instance.limedSpruce,
        child: Padding(
          padding: context.paddingLow,
          child: _buildProfileColumn(context),
        ),
      );

  Column _buildProfileColumn(BuildContext context) => Column(
        children: [
          Padding(
            padding: context.paddingLow,
            child: const RowCavatarText(),
          ),
          context.emptySizedHeightBoxLow,
          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ProfileView()));
              },
              child: CardIconText(
                cardColor: ColorSchemeLight.instance.limedSpruce,
                text: "Profilim",
                icon: Icons.account_circle,
              ),
            ),
          ),
          Expanded(
            child: CardIconText(
              cardColor: context.colorScheme.secondaryVariant,
              text: "Bildirimler",
              icon: Icons.notifications,
            ),
          ),
          Expanded(
            child: CardIconText(
              cardColor: ColorSchemeLight.instance.limedSpruce,
              text: "Çıkış Yap",
              icon: Icons.exit_to_app,
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
        tabs: _buildTabs(items),
        indicatorColor: context.colorScheme.surface,
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
}
