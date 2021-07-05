import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:crm_app/feature/bottomtab/model/bottomtab_model.dart';
import 'package:crm_app/feature/project/view/project_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class BottomTabView extends StatelessWidget {
  const BottomTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<BottomTabModel> items = [
      BottomTabModel(
          title: "Proje", icon: Icons.ac_unit, child: const ProjectView()),
      BottomTabModel(
          title: "Rehber", icon: Icons.contacts_sharp, child: const Scaffold()),
      BottomTabModel(
          title: "Email", icon: Icons.email, child: const Scaffold()),
    ];

    var scaffoldKey = GlobalKey<ScaffoldState>();

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
            IconButton(onPressed: (){
              scaffoldKey.currentState!.openEndDrawer();
            }, icon: const Icon(Icons.settings))
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const CircleAvatar(
                              child: Text("AK"),
                            ),
                            context.emptySizedWidthBoxLow3x,
                            Text(
                              "Ahmet Kaan Uzman",
                              style: context.textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      context.emptySizedHeightBoxLow,
                      Expanded(
                        child: Card(
                          color: ColorSchemeLight.instance.limedSpruce,
                          elevation: 0,
                          child: Padding(
                            padding: context.paddingLow,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  color: context.colorScheme.onSurface,
                                ),
                                context.emptySizedWidthBoxLow3x,
                                const Text("Profilim"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: ColorSchemeLight.instance.limedSpruce,
                          elevation: 0,
                          child: Padding(
                            padding: context.paddingLow,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: context.colorScheme.onSurface,
                                ),
                                context.emptySizedWidthBoxLow3x,
                                const Text("Uygulama Ayarları"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: ColorSchemeLight.instance.limedSpruce,
                          elevation: 0,
                          child: Padding(
                            padding: context.paddingLow,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app,
                                  color: context.colorScheme.onSurface,
                                ),
                                context.emptySizedWidthBoxLow3x,
                                const Text("Çıkış Yap"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Card(
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: ColorSchemeLight.instance.limedSpruce,
                              ),
                              context.emptySizedWidthBoxLow3x,
                              Text(
                                "Hızlı Menü",
                                style: TextStyle(
                                    color:
                                        ColorSchemeLight.instance.limedSpruce),
                              ),
                            ],
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight(0.25),
                              child: Padding(
                                padding: context.horizontalPaddingNormal,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.work,
                                            color: ColorSchemeLight
                                                .instance.limedSpruce,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Yeni Proje",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_add,
                                            color: ColorSchemeLight
                                                .instance.limedSpruce,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Yeni Kişi",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.settings,
                                            color: ColorSchemeLight
                                                .instance.limedSpruce,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Ayarlar",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.phone_rounded,
                                            color: ColorSchemeLight
                                                .instance.limedSpruce,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Yardım ve Destek",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        child: ExpansionTile(
                          title: Row(
                            children: [
                              Image.network(
                                "http://192.168.3.53/assets/users_assets/images/flags/tr.png",
                                width: 24,
                              ),
                              context.emptySizedWidthBoxLow3x,
                              Text(
                                "Dil",
                                style: TextStyle(
                                    color:
                                        ColorSchemeLight.instance.limedSpruce),
                              ),
                            ],
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight(0.25),
                              child: Padding(
                                padding: context.horizontalPaddingNormal,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.network(
                                            "http://192.168.3.53/assets/users_assets/images/flags/germany.jpg",
                                            width: 24,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "German",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.network(
                                            "http://192.168.3.53/assets/users_assets/images/flags/italy.jpg",
                                            width: 24,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Italian",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.network(
                                            "http://192.168.3.53/assets/users_assets/images/flags/spain.jpg",
                                            width: 24,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Spanish",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.network(
                                            "http://192.168.3.53/assets/users_assets/images/flags/russia.jpg",
                                            width: 24,
                                          ),
                                          context.emptySizedWidthBoxLow3x,
                                          Text(
                                            "Russian",
                                            style: TextStyle(
                                                color: ColorSchemeLight
                                                    .instance.limedSpruce),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Renk Modu",style: context.textTheme.bodyText1!.copyWith(color: Colors.black),),

          ],
        ),
      ),
      ),
    );
  }

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
