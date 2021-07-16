import 'package:boardview/boardview_controller.dart';
import 'package:crm_app/feature/project/projectdetail/view/project_detail_view.dart';
import '../../../core/components/text/body_text2_copy.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/components/row/row_circle_avatar.dart';
import '../../../core/components/row/row_icon_text.dart';
import '../../../core/components/row/row_space_between_text.dart';
import '../../../product/widgets/stack/blue_bar.dart';

import '../viewmodel/project_view_model.dart';

import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/bold_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

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
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(child: _buildListViewBuilder),
            const Text("Projeleri silmek veya düzenlemek için sola kaydırın.")
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
            size: 56,
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

  Widget _buildProjectCard(BuildContext context, int index) => Slidable(
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
          ),
        ),
      );

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
                Expanded(
                    child: Container(
                  color: Colors.red,
                )),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                )),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Proje adını giriniz.',
              border: InputBorder.none,
            ),
            cursorColor: context.colorScheme.onSecondary,
          ),
          Divider(
            color: context.colorScheme.secondaryVariant,
            thickness: 0.4,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Proje açıklamasını giriniz.',
              border: InputBorder.none,
            ),
            cursorColor: context.colorScheme.onSecondary,
            maxLines: 6,
          ),
          Divider(
            color: context.colorScheme.secondaryVariant,
            thickness: 0.4,
          ),
          TextButton(
            onPressed: () {},
            child: const BodyText2Copy(
              data: "Ekle",
            ),
          ),
        ],
      ),
    );
  }
}
