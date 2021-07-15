import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/product/model/kanban_model.dart';
import 'package:crm_app/product/widgets/dismissible/delete_dismissible.dart';
import 'package:crm_app/product/widgets/fabbutton/add_fab_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/components/row/row_circle_avatar.dart';
import '../../../core/components/row/row_icon_text.dart';
import '../../../core/components/row/row_space_between_text.dart';
import '../../../product/widgets/stack/blue_bar.dart';

import '../viewmodel/project_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/bold_text.dart';

import '../../projectdetail/view/project_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

// ignore: must_be_immutable
class ProjectView extends StatelessWidget {
  //const ProjectView({Key? key}) : super(key: key);

  late final ProjectViewModel _viewModel;

  final BoardViewController boardViewController = BoardViewController();
  // ignore: use_key_in_widget_constructors
  ProjectView() {
    _viewModel = ProjectViewModel();
    _viewModel.connectDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(child: _buildListViewBuilder),
            const Text(
                "Projeleri silmek için sola düzenlemek için sağa kaydırın.")
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
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) => _buildProjectCard(context, index),
      );

  Widget _buildProjectCard(BuildContext context, int index) => Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            color: context.colorScheme.primaryVariant,
            caption: 'Sil',
            icon: Icons.delete,
            onTap: () {},
          ),
                    IconSlideAction(
            color: context.colorScheme.onPrimary,
            caption: 'Düzenle',
            icon: Icons.more,
            onTap: () {},
          ),
        ],
        child: Card(
          child: ListTile(
            onTap: () {
              goToNextPage(context, index);
            },
            title: BodyText1Copy(data: _viewModel.items[index].name),
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
            _viewModel.items[index].detail,
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
          projectName: _viewModel.items[index].name,
          projectDetail: _viewModel.items[index].detail,
          projectId: _viewModel.items[index].id,
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
