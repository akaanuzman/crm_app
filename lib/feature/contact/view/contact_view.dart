import 'package:crm_app/feature/bottomtab/model/bottomtab_model.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomTabModel> items = [
      BottomTabModel(
          title: "Kişilerim", icon: Icons.people, child: const Scaffold()),
      BottomTabModel(
          title: "Arkadaşlarım",
          icon: Icons.emoji_people,
          child: const Scaffold()),
      BottomTabModel(
          title: "Müşterilerim", icon: Icons.group, child: const Scaffold()),
      BottomTabModel(
          title: "Müşterilerim",
          icon: Icons.connect_without_contact,
          child: const Scaffold()),
    ];
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        body: TabBar(
          tabs: List.generate(
            items.length,
            (index) => Tab(
              text: items[index].title,
              icon: Icon(items[index].icon),
            ),
          ),
        ),
      ),
    );
  }
}
