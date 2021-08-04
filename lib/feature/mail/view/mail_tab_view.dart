import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../bottomtab/model/bottomtab_model.dart';
import '../bin/view/bin_view.dart';
import '../draft/view/draft_view.dart';
import '../important/view/important_view.dart';
import '../incoming/view/incoming_view.dart';
import '../postponed/view/postponed_view.dart';
import '../send/view/send_view.dart';
import '../spam/view/spam_view.dart';
import '../star/view/star_view.dart';

class MailTabView extends StatelessWidget {
  const MailTabView({Key? key}) : super(key: key);

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
          icon: Icons.article_outlined,
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
