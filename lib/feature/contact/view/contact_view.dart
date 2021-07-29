
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../bottomtab/model/bottomtab_model.dart';
import '../mycolleagues/view/my_colleagues_view.dart';
import '../mycontacts/view/my_contacts_view.dart';
import '../mycustomers/view/my_customers_view.dart';
import '../myfriends/view/my_friends_view.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomTabModel> items = [
      BottomTabModel(
          title: "Kişilerim", icon: Icons.people, child: const MyContactsView()),
      BottomTabModel(
          title: "Arkadaşlarım",
          icon: Icons.emoji_people,
          child: const MyFriendsView()),
      BottomTabModel(
          title: "Müşterilerim", icon: Icons.group, child: const MyCustomersView()),
      BottomTabModel(
          title: "İş Arkadaşlarım",
          icon: Icons.connect_without_contact,
          child: const MyColleaguesView()),
    ];
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: _buildTabBar(items, context),
        ),
        body: _buildTabBarView(items),
      ),
    );
  }

  TabBar _buildTabBar(List<BottomTabModel> items, BuildContext context) =>
      TabBar(
        labelPadding: context.paddingLow,
        unselectedLabelColor: context.colorScheme.secondaryVariant,
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
