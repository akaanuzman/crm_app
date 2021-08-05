import 'mail_view.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MailTabView extends StatefulWidget {
  const MailTabView({Key? key}) : super(key: key);

  @override
  _SendMailViewState createState() => _SendMailViewState();
}

class _SendMailViewState extends State<MailTabView> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    MailView(content: "yıldızlı mail"),
    MailView(content: "ertelenen mail"),
    MailView(content: "taslak mail"),
    MailView(content: "gönderilen mail"),
    MailView(content: "çöp mail"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.easeInBack,
        selectedIndex: _selectedIndex,
        iconSize: 24,
        height: 100,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            activeColor: context.colorScheme.surface,
            inactiveColor: context.colorScheme.secondaryVariant,
            title: const Text("Yıldızlı"),
            icon: const Icon(Icons.star_border_outlined),
          ),
          FlashyTabBarItem(
            activeColor: context.colorScheme.surface,
            inactiveColor: context.colorScheme.secondaryVariant,
            title: const Text("Ertelendi"),
            icon: const Icon(Icons.schedule_outlined),
          ),
          FlashyTabBarItem(
            activeColor: context.colorScheme.surface,
            inactiveColor: context.colorScheme.secondaryVariant,
            title: const Text("Taslak"),
            icon: const Icon(Icons.article_outlined),
          ),
          FlashyTabBarItem(
            activeColor: context.colorScheme.surface,
            inactiveColor: context.colorScheme.secondaryVariant,
            title: const Text("Gönderilenler"),
            icon: const Icon(Icons.send_outlined),
          ),
          FlashyTabBarItem(
            activeColor: context.colorScheme.surface,
            inactiveColor: context.colorScheme.secondaryVariant,
            title: const Text("Çöp Kutusu"),
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }
}
