// ignore_for_file: prefer_const_constructors

import 'package:crm_app/feature/home/bottomtab/model/bottomtab_model.dart';
import 'package:crm_app/feature/home/mail/view/inbox/view/inbox_view.dart';
import 'package:crm_app/feature/home/mail/view/postponed/view/postponed_view.dart';
import 'package:crm_app/feature/home/mail/view/star/view/star_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../bin/view/bin_view.dart';
import '../../draft/view/draft_view.dart';
import '../../important/view/important_view.dart';
import '../../incoming/view/incoming_view.dart';
import '../../spam/view/spam_view.dart';

class MailTabView extends StatelessWidget {
  const MailTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BottomTabModel> _items = [
      BottomTabModel(
        title: "Gelen Kutusu",
        icon: Icons.inbox,
        child: InboxView(),
      ),
      BottomTabModel(
        title: "Yıldızlı",
        icon: Icons.star_border_outlined,
        child: StarView(),
      ),
      BottomTabModel(
        title: "Ertelendi",
        icon: Icons.schedule_outlined,
        child: PostponedView(),
      ),
      BottomTabModel(
        title: "Taslak",
        icon: Icons.article_outlined,
        child: DraftView(),
      ),
      BottomTabModel(
        title: "Gönderilenler",
        icon: Icons.send_outlined,
        child: IncomingView(),
      ),
      BottomTabModel(
        title: "Çöp Kutusu",
        icon: Icons.delete_forever_outlined,
        child: BinView(),
      ),
      BottomTabModel(
        title: "Önemli",
        icon: Icons.label,
        child: ImportantView(),
      ),
      BottomTabModel(
        title: "Spam",
        icon: Icons.warning,
        child: SpamView(),
      ),
    ];
    return DefaultTabController(
      length: _items.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: _buildTabBar(context, _items),
        ),
        body: _buildTabBarView(_items),
      ),
    );
  }

  TabBar _buildTabBar(BuildContext context, List<BottomTabModel> _items) =>
      TabBar(
        isScrollable: true,
        unselectedLabelColor: context.colorScheme.primary,
        labelColor: context.colorScheme.background,
        indicatorColor: context.colorScheme.background,
        tabs: _buildTabs(_items),
      );

  List<Widget> _buildTabs(List<BottomTabModel> _items) => List.generate(
        _items.length,
        (index) => Tab(
          text: _items[index].title,
          icon: Icon(_items[index].icon),
        ),
      );

  TabBarView _buildTabBarView(List<BottomTabModel> models) =>
      TabBarView(children: models.map((e) => e.child).toList());
}
