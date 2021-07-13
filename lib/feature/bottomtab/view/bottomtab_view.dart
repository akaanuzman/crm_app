import 'package:crm_app/feature/contact/view/contact_view.dart';

import '../../project/viewmodel/project_view_model.dart';

import '../../../core/components/card/card_icon_text.dart';
import '../../../core/components/row/row_flag_text.dart';
import '../../../core/components/row/row_icon_text.dart';
import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/subtitle1_copy.dart';
import '../../../product/widgets/row/row_cavatar_text.dart';
import '../../../product/widgets/switch_list_tile/switch_list_tile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          title: "Email", icon: Icons.email, child: const Scaffold()),
    ];

    var scaffoldKey = GlobalKey<ScaffoldState>();

    final ProjectViewModel _viewModel = ProjectViewModel();

    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        key: scaffoldKey,
        appBar: _buildAppBar(context, scaffoldKey, items),
        body: _buildTabBarView(items),
        drawer: _buildDrawer(context),
        endDrawer: _buildEndDrawer(context, _viewModel),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context,
          GlobalKey<ScaffoldState> scaffoldKey, List<BottomTabModel> items) =>
      AppBar(
          title: Image.network(
            "http://192.168.3.53/assets/images/logo-light.png",
            width: context.dynamicWidth(0.28),
          ),
          actions: [_buildSettingsButton(scaffoldKey)],
          centerTitle: true,
          bottom: _buildTabBar(items, context));

  IconButton _buildSettingsButton(GlobalKey<ScaffoldState> scaffoldKey) =>
      IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
          icon: const Icon(Icons.settings));

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
                    _buildFastMenuCard(context),
                    _buildFlagsCard(context),
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
            child: CardIconText(
              cardColor: ColorSchemeLight.instance.limedSpruce,
              text: "Profilim",
              icon: Icons.account_circle,
            ),
          ),
          Expanded(
            child: CardIconText(
              cardColor: context.colorScheme.secondaryVariant,
              text: "Uygulama Ayarları",
              icon: Icons.settings,
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

  Card _buildFastMenuCard(BuildContext context) => Card(
        child: ExpansionTile(
          title: const RowIconText(icon: Icons.home, text: "Hızlı Menü"),
          children: [_buildFastMenuContainer(context)],
        ),
      );

  SizedBox _buildFastMenuContainer(BuildContext context) => SizedBox(
        height: context.dynamicHeight(0.25),
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: _buildFastMenuColumn,
        ),
      );

  Column get _buildFastMenuColumn => Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: RowIconText(icon: Icons.work, text: "Yeni Proje"),
          ),
          const Expanded(
            child: RowIconText(icon: Icons.person_add, text: "Yeni Kişi"),
          ),
          const Expanded(
            child: RowIconText(
              icon: Icons.settings,
              text: "Ayarlar",
            ),
          ),
          const Expanded(
            child: RowIconText(
              icon: Icons.phone_rounded,
              text: "Yardım ve Destek",
            ),
          ),
        ],
      );

  Card _buildFlagsCard(BuildContext context) => Card(
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

  Drawer _buildEndDrawer(BuildContext context, ProjectViewModel _viewModel) =>
      Drawer(
        child: Padding(
          padding: context.paddingLow,
          child: _buildDrawerColumn(context, _viewModel),
        ),
      );

  Column _buildDrawerColumn(
          BuildContext context, ProjectViewModel _viewModel) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText1Copy(
            data: "Renk Modu",
            color: context.colorScheme.onSecondary,
          ),
          Observer(builder: (_) => _builSwitchListTile(_viewModel, context))
        ],
      );

  DefaultSwitchListTile _builSwitchListTile(
          ProjectViewModel _viewModel, BuildContext context) =>
      DefaultSwitchListTile(
        value: _viewModel.isSwitchListTileOpen,
        child: Subtitle1Copy(
          data: "Karanlık Tema",
          color: context.colorScheme.onSecondary,
        ),
        onChanged: (value) {
          _viewModel.openCloseSwitchListTile(value);
        },
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
