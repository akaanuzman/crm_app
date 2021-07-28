import 'package:boardview/boardview_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

import '../../../core/components/row/row_circle_avatar.dart';
import '../../../core/components/row/row_icon_text.dart';
import '../../../core/components/row/row_space_between_text.dart';
import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import '../../../core/components/text/bold_text.dart';
import '../../../product/widgets/stack/blue_bar.dart';
import '../projectdetail/view/project_detail_view.dart';
import '../viewmodel/project_view_model.dart';

// ignore: must_be_immutable
class ProjectView extends StatefulWidget {
  //const ProjectView({Key? key}) : super(key: key);

  late final ProjectViewModel _viewModel;

  // ignore: use_key_in_widget_constructors
  ProjectView() {
    _viewModel = ProjectViewModel();
    _viewModel.connectDataBase();
  }

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final BoardViewController boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projeler",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(child: _buildListViewBuilder),
            const Text("Projeleri silmek veya düzenlemek için sağa kaydırın.")
          ],
        ),
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.onPrimary,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.add_rounded,
            size: 48,
            color: context.colorScheme.onSurface,
          ),
        ),
        popUp: PopUpItem(
          padding: context.paddingNormal,
          color: context.colorScheme.onSurface,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          elevation: 2,
          tag: 'Proje Ekle',
          child: const PopUpItemBody(),
        ),
      ),
    );
  }

  Widget get _buildListViewBuilder => ListView.builder(
        itemCount: widget._viewModel.items.length,
        itemBuilder: (context, index) => _buildProjectCard(context, index),
      );

  Widget _buildProjectCard(BuildContext context, int index) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          color: context.colorScheme.primaryVariant,
          caption: 'Sil',
          icon: Icons.delete,
          onTap: () {
            setState(() {
              widget._viewModel.deleteItem(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: context.colorScheme.secondaryVariant,
                duration: context.durationSlow,
                content: BodyText2Copy(
                  data: "Proje başarıyla silindi !",
                  color: context.colorScheme.onSurface,
                ),
              ),
            );
          },
        ),
        IconSlideAction(
          color: context.colorScheme.onPrimary,
          foregroundColor: context.colorScheme.onSurface,
          caption: 'Düzenle',
          icon: Icons.edit,
          onTap: () {
            _showModalBottomSheet(context);
          },
        ),
      ],
      child: Card(
        child: ListTile(
          onTap: () {
            goToNextPage(context, index);
          },
          title: BodyText1Copy(data: widget._viewModel.items[index].name),
          subtitle: _buildSubtitle(context, index),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  Column _buildSubtitle(BuildContext context, int index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRowIconText,
          context.emptySizedHeightBoxLow3x,
          Text(
            widget._viewModel.items[index].detail,
          ),
          _buildRowIconTextText(context),
          const RowCircleAvatar(firstText: "AA", secondText: "BB"),
          context.emptySizedHeightBoxLow3x,
          const RowSpaceBetweenText(
              firstText: "Task complated: ", secondText: "3/4"),
          context.emptySizedHeightBoxLow,
          const BlueBar(),
          context.emptySizedHeightBoxLow3x
        ],
      );

  RowIconText get _buildRowIconText => const RowIconText(
        icon: Icons.account_circle_rounded,
        text: "Ahmet Kaan Uzman",
        sizedBox: SizedBox(
          height: 0,
          width: 2,
        ),
      );

  Row _buildRowIconTextText(BuildContext context) => Row(
        children: [
          const Icon(Icons.list),
          context.emptySizedWidthBoxLow,
          const BoldText(data: "0"),
          context.emptySizedWidthBoxLow,
          const Text(
            "Görev",
          ),
          context.emptySizedHeightBoxHigh
        ],
      );

  void goToNextPage(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProjectDetailView(
          projectName: widget._viewModel.items[index].name,
          projectDetail: widget._viewModel.items[index].detail,
          projectId: widget._viewModel.items[index].id,
        ),
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: context.dynamicHeight(0.4),
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
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Proje Adı"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Proje adı.',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Proje Detayları"),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Proje detayları.',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                  maxLines: 2,
                ),
                context.emptySizedHeightBoxLow,
                Divider(
                  color: context.colorScheme.secondaryVariant,
                  thickness: 0.4,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.save),
                          context.emptySizedWidthBoxLow,
                          const BodyText2Copy(
                            data: "Kaydet",
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        });
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
                child: const BodyText1Copy(data: "Proje Ekle")),
          ),
          Padding(
            padding: context.paddingLow,
            child: const Text("Proje Adı"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Proje adı.',
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
            child: const Text("Proje Detayları"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Proje detayları.',
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
            maxLines: 6,
          ),
          Padding(
            padding: context.paddingLow,
            child: const Text("Erişim Kodu"),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Erişim kodu oluştur.',
              prefixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
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
          Center(
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.add),
                    context.emptySizedWidthBoxLow,
                    const BodyText2Copy(
                      data: "Ekle",
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
