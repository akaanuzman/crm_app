import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../bottomtab/model/bottomtab_model.dart';
import '../profile_edit/view/profile_edit_view.dart';
import 'my_profile_view.dart';

class ProfileTabbarView extends StatelessWidget {
  const ProfileTabbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomTabModel> items = [
      BottomTabModel(
          title: "Hakkımda", icon: Icons.person, child: const MyProfileView()),
      BottomTabModel(
          title: "Düzenle", icon: Icons.edit, child: ProfileEditView()),
    ];
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(
          title: Image.network(
            "http://192.168.3.53/assets/images/logo-light.png",
            width: context.dynamicWidth(0.28),
          ),
          centerTitle: true,
          bottom: _buildTabBar(items, context),
        ),
        body: _buildTabBarView(items),
      ),
    );
  }

  TabBar _buildTabBar(List<BottomTabModel> items, BuildContext context) =>
      TabBar(
        unselectedLabelColor: context.colorScheme.onSurface,
        tabs: _buildTabs(items),
        indicatorColor: context.colorScheme.primary,
        isScrollable: true,
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
