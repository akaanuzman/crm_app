import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:popup_card/popup_card.dart';

import '../viewmodel/project_detail_view_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectDetailView extends StatefulWidget {
  //const ProjecetDetailView({Key? key}) : super(key: key);

  final String projectName;
  final String projectDetail;
  final int projectId;
  late final DateTime _now;
  late final DateTime _date;
  late final ProjectDetailViewModel _viewModel;

  // ignore: use_key_in_widget_constructors
  ProjectDetailView(
      {required this.projectName,
      required this.projectDetail,
      required this.projectId}) {
    _viewModel = ProjectDetailViewModel();
    _viewModel.connectDataBase(projectId);
    _now = DateTime.now();
    _date = DateTime(_now.year, _now.month, _now.day);
  }

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  //List<String> menuItems = ["Liste", "Kanban"];

  @override
  Widget build(BuildContext context) {
    //String menuValue = menuItems.first;
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.onPrimary,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.add_rounded,
            size: 56,
            color: context.colorScheme.onSurface,
          ),
        ),
        popUp: PopUpItem(
          padding: context.paddingNormal,
          color: context.colorScheme.onPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          elevation: 2,
          tag: 'Proje Ekle',
          child: const PopUpItemBody(),
        ),
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  Card(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          context.emptySizedHeightBoxLow,
                          Text(widget.projectName,
                              style: context.textTheme.headline3),
                          context.emptySizedHeightBoxLow,
                          const BodyText1Copy(data: "Proje Hakkında: "),
                          context.emptySizedHeightBoxLow,
                          Text(
                            widget.projectDetail,
                            maxLines: 1,
                          ),
                          context.emptySizedHeightBoxNormal,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const BodyText2Copy(
                                data: "Başlanma\n   Tarihi",
                              ),
                              const BodyText2Copy(
                                  data: "Tamamlanma\n       Tarihi"),
                              const BodyText2Copy(data: "Anlaşılan\n    Fiyat")
                            ],
                          ),
                          context.emptySizedHeightBoxLow,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(widget._viewModel.items[0].sDate
                                  .toString()
                                  .substring(0, 10)),
                              Text(widget._viewModel.items[0].fDate
                                  .toString()
                                  .substring(0, 10)),
                              const Text("\$15,800")
                            ],
                          ),
                          context.emptySizedHeightBoxLow3x,
                          const BodyText2Copy(data: "Erişim Sahipleri--"),
                          context.emptySizedHeightBoxLow,
                          Row(
                            children: [
                              const CircleAvatar(
                                child: Text("AA"),
                              ),
                              context.emptySizedWidthBoxLow,
                              const CircleAvatar(
                                child: Text("AA"),
                              ),
                              context.emptySizedWidthBoxLow,
                              const CircleAvatar(
                                child: Text("AA"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                        title: Text(
                          "Kalan Görevler",
                          style: context.textTheme.headline3,
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            context.emptySizedHeightBoxLow,
                            SizedBox(
                              width: context.dynamicWidth(0.35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text("1"),
                                  const Text("%25"),
                                  const Text("4")
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Divider(
                                  thickness: 15,
                                  endIndent: context.dynamicWidth(0.5),
                                ),
                                Divider(
                                  thickness: 15,
                                  endIndent: context.dynamicWidth(0.8),
                                  color: context.colorScheme.surface,
                                ),
                              ],
                            ),
                            context.emptySizedHeightBoxLow,
                            const Text("Tamamlanan / Toplam Görev"),
                            context.emptySizedHeightBoxLow,
                            Expanded(
                              child: ListView.builder(
                                itemCount: widget._viewModel.items.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        widget._viewModel.items[index].name,
                                        style: context.textTheme.headline4,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                      ),
                                    ),
                                    context.emptySizedHeightBoxLow3x
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.horizontalPaddingLow,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Görevler",
                  style: context.textTheme.headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Row(
              children: [
                context.emptySizedWidthBoxLow3x,
                const Icon(Icons.filter_alt),
                context.emptySizedWidthBoxLow,
                DropdownButton(
                  hint: const Text("Görünüm"),
                  value: widget._viewModel.menuValue,
                  items: widget._viewModel.menuItems
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      widget._viewModel.onChanged(value!);
                      value == "Kanban"
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Scaffold()))
                          : null;
                    });
                  },
                )
              ],
            ),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: widget._viewModel.items.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: BodyText2Copy(
                      data: widget._viewModel.items[index].name,
                    ),
                    trailing: SizedBox(
                      height: context.dynamicHeight(0.1),
                      width: context.dynamicWidth(0.25),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          context.emptySizedWidthBoxLow,
                          Text(
                              "${widget._date.day}/${widget._date.month}/${widget._date.year}")
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Görevin adını giriniz.',
              hintStyle: TextStyle(color: context.colorScheme.onSurface),
              border: InputBorder.none,
            ),
            cursorColor: context.colorScheme.onSecondary,
          ),
          Divider(
            color: context.colorScheme.onSurface,
            thickness: 1,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Görevin açıklamasını giriniz.',
              hintStyle: TextStyle(color: context.colorScheme.onSurface),
              labelStyle: TextStyle(color: context.colorScheme.onSurface),
              border: InputBorder.none,
            ),
            cursorColor: context.colorScheme.onSecondary,
            maxLines: 6,
          ),
          Divider(
            color: context.colorScheme.onSurface,
            thickness: 1,
          ),
          TextButton(
              onPressed: () {},
              child: BodyText2Copy(
                data: "Ekle",
                color: context.colorScheme.onSurface,
              )),
        ],
      ),
    );
  }
}