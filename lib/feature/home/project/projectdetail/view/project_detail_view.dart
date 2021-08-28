
// ignore_for_file: duplicate_import

import 'package:crm_app/product/widgets/kanban/kanban.dart';
import 'package:crm_app/product/widgets/kanban/kanban.dart';

import '../../../../../core/components/text/body_text1_copy.dart';
import '../../../../../core/components/text/body_text2_copy.dart';
import '../../../../../core/components/text/bold_text.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../product/widgets/stack/blue_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'package:popup_card/popup_card.dart';

import '../viewmodel/project_detail_view_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectDetailView extends StatefulWidget {
  final int allTask;
  final int okTask;
  final ProjectDetailViewModel _viewModel = ProjectDetailViewModel();
  final String projectId;

  ProjectDetailView(
      {Key? key,
      required this.allTask,
      required this.okTask,
      required this.projectId})
      : super(key: key);

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  late final ProjectDetailViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget._viewModel;
    viewModel.fetchItems(
        ApplicationConstants.instance!.token, widget.projectId);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    var division = (widget.okTask * 100) / widget.allTask;

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
        child: Padding(
          padding: EdgeInsets.zero,
          child: Material(
            color: context.colorScheme.onPrimary,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: context.highBorderRadius),
            child: Icon(
              Icons.add_rounded,
              size: 48,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        popUp: PopUpItem(
          padding: context.paddingNormal,
          color: context.colorScheme.onSurface,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          elevation: 2,
          tag: 'Proje Ekle',
          child: PopUpItemBody(
            now: DateTime.now(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(
        builder: (context) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: context.dynamicHeight(1.5),
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    // ignore: prefer_const_constructors
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Card(
                              child: Padding(
                                padding: context.paddingNormal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      child: Icon(
                                        Icons.list_rounded,
                                        size: context.dynamicWidth(0.1),
                                        color: context.colorScheme.surface,
                                      ),
                                      backgroundColor:
                                          context.colorScheme.secondary,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        BodyText1Copy(
                                          data: widget.allTask.toString(),
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                        context.emptySizedHeightBoxLow,
                                        const BodyText2Copy(
                                            data: "Toplam Görev"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // ignore: prefer_const_constructors
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Card(
                              child: Padding(
                                padding: context.paddingNormal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                        radius: 40,
                                        child: Icon(
                                          Icons.task_alt,
                                          size: context.dynamicWidth(0.1),
                                          color: context.colorScheme.onPrimary,
                                        ),
                                        backgroundColor:
                                            context.colorScheme.secondary),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        BodyText1Copy(
                                          data: viewModel.items.doc?.length
                                                  .toString() ??
                                              "0",
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                        context.emptySizedHeightBoxLow,
                                        const BodyText2Copy(data: "Dosyalar"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // ignore: prefer_const_constructors
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Card(
                              child: Padding(
                                padding: context.paddingNormal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      child: Icon(Icons.group,
                                          size: context.dynamicWidth(0.1),
                                          color: context.colorScheme.onError),
                                      backgroundColor:
                                          context.colorScheme.secondary,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        BodyText1Copy(
                                          data: viewModel.items.users?.length
                                                  .toString() ??
                                              "0",
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                        context.emptySizedHeightBoxLow,
                                        const BodyText2Copy(
                                            data: "Erişim Sahipleri"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    // ignore: prefer_const_constructors
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: context.paddingLow,
                            child: Card(
                              child: Padding(
                                padding: context.paddingNormal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      child: Icon(Icons.schedule,
                                          size: context.dynamicWidth(0.1),
                                          color: context.colorScheme.error),
                                      backgroundColor:
                                          context.colorScheme.secondary,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        BodyText1Copy(
                                          data: "20 Gün",
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                        context.emptySizedHeightBoxLow,
                                        const BodyText2Copy(
                                            data: "Ayrılan Süre"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: context.paddingLow,
                    child: Text(
                      "Proje Detayları",
                      style: context.textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onSecondary),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Expanded(
                      flex: 3,
                      child: PageView(
                        //scrollDirection: Axis.vertical,
                        children: [
                          Card(
                            elevation: 5,
                            child: ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  context.emptySizedHeightBoxLow,
                                  Text(viewModel.items.name ?? "",
                                      style: context.textTheme.headline3),
                                  context.emptySizedHeightBoxLow,
                                  BoldText(
                                    data:
                                        "Erişim kodunuz: ${viewModel.items.access}",
                                  ),
                                  context.emptySizedHeightBoxLow3x,
                                  const BodyText1Copy(data: "Proje Hakkında: "),
                                  context.emptySizedHeightBoxLow,
                                  Text(
                                    viewModel.items.detail ?? "",
                                    maxLines: 1,
                                  ),
                                  context.emptySizedHeightBoxNormal,
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const BodyText2Copy(
                                        data: "Başlanma\n   Tarihi",
                                      ),
                                      context.emptySizedWidthBoxLow3x,
                                      const BodyText2Copy(
                                          data: "Tamamlanma\n       Tarihi"),
                                    ],
                                  ),
                                  context.emptySizedHeightBoxLow,
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(viewModel.items.gorev?[0].s_date ??
                                          "null"),
                                      context.emptySizedWidthBoxLow3x,
                                      Text(viewModel.items.gorev?[0].f_date ??
                                          "null"),
                                    ],
                                  ),
                                  context.emptySizedHeightBoxLow3x,
                                  const BodyText2Copy(
                                      data: "Erişim Sahipleri--"),
                                  context.emptySizedHeightBoxLow,
                                  SizedBox(
                                    height: context.dynamicHeight(0.05),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                viewModel.items.users?.length,
                                            itemBuilder: (context, index) =>
                                                CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  viewModel.items.users?[index]
                                                          .photo ??
                                                      "http://192.168.3.53/assets/images/users/user0.jpg"),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _showModalBottomSheet(
                                                context, radius);
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                                context.colorScheme.onPrimary,
                                            child: Icon(Icons.add,
                                                color: context
                                                    .colorScheme.onSurface,
                                                size: 32),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                                title: Padding(
                                  padding: context.verticalPaddingLow,
                                  child: Text(
                                    "Kalan Görevler",
                                    style: context.textTheme.headline3,
                                  ),
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
                                          Text(widget.okTask.toString()),
                                          Text("%$division"),
                                          Text(widget.allTask.toString())
                                        ],
                                      ),
                                    ),
                                    BlueBar(
                                      width: widget.allTask == 1
                                          ? 0
                                          : widget.okTask / widget.allTask ==
                                                  0.75
                                              ? 0.2
                                              : widget.okTask /
                                                          widget.allTask ==
                                                      0.5
                                                  ? 0.345
                                                  : widget.okTask /
                                                              widget.allTask ==
                                                          0.25
                                                      ? 0.5
                                                      : 0,
                                    ),
                                    context.emptySizedHeightBoxLow,
                                    const Text("Tamamlanan / Toplam Görev"),
                                    context.emptySizedHeightBoxLow,
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount:
                                            viewModel.items.gorev?.length ?? 0,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Container(
                                              padding: context.paddingLow,
                                              alignment: Alignment.center,
                                              child: Text(
                                                viewModel.items.gorev?[index]
                                                        .name ??
                                                    "",
                                                style:
                                                    context.textTheme.headline4,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.red),
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
                    );
                  }),
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
                                    builder: (context) =>  BoardViewExample()))
                                : null;
                          });
                        },
                      )
                    ],
                  ),
                  context.emptySizedHeightBoxLow,
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: viewModel.items.gorev?.length ?? 0,
                      itemBuilder: (context, index) => Padding(
                        padding: context.paddingLow,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          child: ListTile(
                            leading: Padding(
                              padding: context.paddingLow,
                              child:
                                  const Icon(Icons.pending_actions, size: 28),
                            ),
                            title: BodyText2Copy(
                                data: viewModel.items.gorev?[index].name ?? ""),
                            subtitle: Text(
                                viewModel.items.gorev?[index].detail ?? ""),
                            trailing: Text(
                                "${viewModel.items.gorev?[index].s_date} - ${viewModel.items.gorev?[index].f_date}"),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(context, double radius) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: context.dynamicHeight(0.7),
          padding: context.paddingNormal,
          decoration: BoxDecoration(
            color: context.colorScheme.onSurface,
            borderRadius: BorderRadius.only(
              topLeft: context.highadius,
              topRight: context.highadius,
            ),
          ),
          child: Column(
            children: [
              context.emptySizedHeightBoxLow,
              Center(
                child: Container(
                  height: context.dynamicWidth(0.03),
                  width: context.dynamicWidth(0.2),
                  decoration: BoxDecoration(
                      borderRadius: context.lowBorderRadius,
                      color: context.colorScheme.background),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BodyText1Copy(data: "Yeni Kişi Ekle"),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: context.colorScheme.primaryVariant,
                      child: Icon(
                        Icons.close,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                child: Container(
                  padding: context.paddingNormal,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: context.colorScheme.secondaryVariant),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    //itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                      padding: context.paddingLow,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: context.colorScheme.secondaryVariant),
                        ),
                        child: const ListTile(
                          title: BodyText2Copy(data: "kisi ismi"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: context.paddingLow,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: BodyText2Copy(
                          data: "Vazgeç", color: context.colorScheme.onSurface),
                      style: ElevatedButton.styleFrom(
                          primary: context.colorScheme.secondaryVariant),
                    ),
                    context.emptySizedWidthBoxLow,
                    ElevatedButton(
                      onPressed: () {},
                      child: BodyText2Copy(
                          data: "Ekle", color: context.colorScheme.onSurface),
                      style: ElevatedButton.styleFrom(
                          primary: context.colorScheme.surface),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PopUpItemBody extends StatelessWidget {
  final DateTime now;

  const PopUpItemBody({Key? key, required this.now}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: context.colorScheme.primaryVariant,
                child: Icon(
                  Icons.close,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: context.paddingLow,
              child: const BodyText1Copy(data: "Görev Ekle"),
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: const Text("İsim"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Görev ismi.',
              enabledBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.onBackground),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.surface),
              ),
            ),
            cursorColor: context.colorScheme.onSecondary,
          ),
          context.emptySizedHeightBoxLow,
          Padding(
            padding: context.paddingLow,
            child: const Text("Detaylar"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Görev detayları.',
              enabledBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.onBackground),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.surface),
              ),
            ),
            cursorColor: context.colorScheme.onSecondary,
            maxLines: 3,
          ),
          Padding(
            padding: context.paddingLow,
            child: const Text("Başlama Tarihi"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'mm/dd/yy',
              prefixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(DateTime.now().year - 5),
                      lastDate: DateTime(DateTime.now().year + 5),
                    );
                  },
                  icon: const Icon(Icons.calendar_today)),
              enabledBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.onBackground),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.surface),
              ),
            ),
            cursorColor: context.colorScheme.onSecondary,
          ),
          Padding(
            padding: context.paddingLow,
            child: const Text("Bitiş Tarihi"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'mm/dd/yy',
              prefixIcon: IconButton(
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: DateTime(DateTime.now().year - 5),
                        lastDate: DateTime(DateTime.now().year + 5));
                  },
                  icon: const Icon(Icons.calendar_today)),
              enabledBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.onBackground),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: context.lowBorderRadius,
                borderSide: BorderSide(color: context.colorScheme.surface),
              ),
            ),
            cursorColor: context.colorScheme.onSecondary,
          ),
          context.emptySizedHeightBoxLow,
          Divider(
            color: context.colorScheme.secondaryVariant,
            thickness: 0.4,
          ),
          Padding(
            padding: context.paddingLow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: BodyText2Copy(
                      data: "Vazgeç", color: context.colorScheme.onSurface),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.secondaryVariant),
                ),
                context.emptySizedWidthBoxLow,
                ElevatedButton(
                  onPressed: () {},
                  child: BodyText2Copy(
                      data: "Ekle", color: context.colorScheme.onSurface),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.surface),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
