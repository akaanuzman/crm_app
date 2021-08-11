import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';
import 'package:popup_card/popup_card.dart';

import '../viewmodel/project_detail_view_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectDetailView extends StatefulWidget {
  //const ProjecetDetailView({Key? key}) : super(key: key);

  late final DateTime _now;
  late final DateTime _date;
  late final ProjectDetailViewModel _viewModel;
  final int allTask;

  // ignore: use_key_in_widget_constructors
  ProjectDetailView({Key? key,required this.allTask}) {
    _viewModel = ProjectDetailViewModel();
    _now = DateTime.now();
    _date = DateTime(_now.year, _now.month, _now.day);
  }

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;
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
            now: widget._now,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: SingleChildScrollView(
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: widget.allTask.toString(),
                                        color: context.colorScheme.onSecondary,
                                      ),
                                      context.emptySizedHeightBoxLow,
                                      const BodyText2Copy(data: "Toplam Görev"),
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: "0",
                                        color: context.colorScheme.onSecondary,
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: "1",
                                        color: context.colorScheme.onSecondary,
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
                                    child: Icon(Icons.list_rounded,
                                        size: context.dynamicWidth(0.1),
                                        color: context.colorScheme.error),
                                    backgroundColor:
                                        context.colorScheme.secondary,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BodyText1Copy(
                                        data: "20 Gün",
                                        color: context.colorScheme.onSecondary,
                                      ),
                                      context.emptySizedHeightBoxLow,
                                      const BodyText2Copy(data: "Ayrılan Süre"),
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
                Expanded(
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
                              Text("",
                                  style: context.textTheme.headline3),
                              context.emptySizedHeightBoxLow,
                              const BodyText1Copy(data: "Proje Hakkında: "),
                              context.emptySizedHeightBoxLow,
                              const Text(
                                "widget.projectDetail",
                                maxLines: 1,
                              ),
                              context.emptySizedHeightBoxNormal,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const BodyText2Copy(
                                    data: "Başlanma\n   Tarihi",
                                  ),
                                  const BodyText2Copy(
                                      data: "Tamamlanma\n       Tarihi"),
                                  const BodyText2Copy(
                                      data: "Anlaşılan\n    Fiyat")
                                ],
                              ),
                              context.emptySizedHeightBoxLow,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(""),
                                  Text("widget._viewModel.items[0].fDate"
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
                                  context.emptySizedWidthBoxLow,
                                  InkWell(
                                    onTap: () {
                                      _showModalBottomSheet(context, radius);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          context.colorScheme.onPrimary,
                                      child: Icon(
                                        Icons.add,
                                        color: context.colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ],
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
                                    //itemCount: widget._viewModel.items.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Container(
                                          padding: context.paddingLow,
                                          alignment: Alignment.center,
                                          child: Text(
                                            //widget._viewModel.items[index].name,
                                            "",
                                            style: context.textTheme.headline4,
                                          ),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
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
                  flex: 2,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    //itemCount: widget._viewModel.items.length,
                    itemBuilder: (context, index) => Padding(
                      padding: context.paddingLow,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius),
                        ),
                        child: ListTile(
                          title: const BodyText2Copy(
                            //data: widget._viewModel.items[index].name,
                            data: "",
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
                  ),
                )
              ],
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
            child: InkWell(
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
