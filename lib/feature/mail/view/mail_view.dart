import 'package:crm_app/feature/bottomtab/model/bottomtab_model.dart';
import 'package:crm_app/feature/mail/bin/view/bin_view.dart';
import 'package:crm_app/feature/mail/draft/view/draft_view.dart';
import 'package:crm_app/feature/mail/important/view/important_view.dart';
import 'package:crm_app/feature/mail/incoming/view/incoming_view.dart';
import 'package:crm_app/feature/mail/postponed/view/postponed_view.dart';
import 'package:crm_app/feature/mail/send/view/send_view.dart';
import 'package:crm_app/feature/mail/spam/view/spam_view.dart';
import 'package:crm_app/feature/mail/star/view/star_view.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class MailView extends StatelessWidget {
  const MailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomTabModel> items = [
      BottomTabModel(
          title: "Gelen", icon: Icons.people, child: const IncomingView()),
      BottomTabModel(
          title: "Yıldızlı",
          icon: Icons.star_border_outlined,
          child: const StarView()),
      BottomTabModel(
          title: "Ertelendi",
          icon: Icons.schedule_outlined,
          child: const PostponedView()),
      BottomTabModel(
          title: "Taslak",
          icon: Icons.connect_without_contact,
          child: const DraftView()),
      BottomTabModel(
          title: "Gönderilenler",
          icon: Icons.send_outlined,
          child: const SendView()),
      BottomTabModel(
          title: "Çöp Kutusu",
          icon: Icons.delete_forever_outlined,
          child: const BinView()),
      BottomTabModel(
          title: "Önemli",
          icon: Icons.label_important_outline,
          child: const ImportantView()),
      BottomTabModel(
          title: "Spam",
          icon: Icons.warning_amber_outlined,
          child: const SpamView()),
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
        unselectedLabelColor: context.colorScheme.secondaryVariant,
        tabs: _buildTabs(items),
        indicatorColor: context.colorScheme.surface,
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
