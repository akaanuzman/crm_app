import '../../../core/components/card/card_icon_text.dart';
import '../../../core/components/row/row_flag_text.dart';
import '../../../core/components/row/row_icon_text.dart';
import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/subtitle1_copy.dart';
import '../../project/model/project_model.dart';
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
          title: "Proje", icon: Icons.assignment, child: const ProjectView()),
      BottomTabModel(
          title: "Rehber", icon: Icons.contacts_sharp, child: const Scaffold()),
      BottomTabModel(
          title: "Email", icon: Icons.email, child: const Scaffold()),
    ];

    var scaffoldKey = GlobalKey<ScaffoldState>();

    final ProjectModel _viewModel = ProjectModel();

    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Image.network(
            "http://192.168.3.53/assets/images/logo-light.png",
            width: context.dynamicWidth(0.28),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                icon: const Icon(Icons.settings))
          ],
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
          child: _buildTabBar(items, context),
        ),
        body: _buildTabBarView(items),
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: ColorSchemeLight.instance.limedSpruce,
                  child: Padding(
                    padding: context.paddingLow,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: RowCavatarText(),
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
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildFastMenuCard(context),
                    _buildFlagsCard(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        endDrawer: _buildEndDrawer(context, _viewModel),
      ),
    );
  }

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

  Drawer _buildEndDrawer(BuildContext context, ProjectModel _viewModel) =>
      Drawer(
        child: Padding(
          padding: context.paddingLow,
          child: _buildDrawerColumn(context, _viewModel),
        ),
      );

  Column _buildDrawerColumn(BuildContext context, ProjectModel _viewModel) =>
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
          ProjectModel _viewModel, BuildContext context) =>
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
