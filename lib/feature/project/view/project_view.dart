import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:crm_app/product/model/kanban_model.dart';

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
      body: Observer(builder: (_) {
        return Padding(
          padding: context.paddingLow,
          child: _buildBody(context),
        );
      }),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildAddProjectButton(context),
        ),
        context.emptySizedHeightBoxLow,
        Expanded(
          flex: 12,
          child: _buildListViewBuilder,
        )
      ],
    );
  }

  ElevatedButton _buildAddProjectButton(BuildContext context) => ElevatedButton(
        onPressed: () {},
        child: BodyText1Copy(
          data: "Proje Ekle",
          color: context.colorScheme.onSurface,
        ),
      );

  ListView get _buildListViewBuilder => ListView.builder(
      itemCount: _viewModel.items.length,
      itemBuilder: (context, index) => _buildProjectCard(context, index),
    );

  Card _buildProjectCard(BuildContext context, int index) => Card(
        child: ListTile(
          onTap: () {
            goToNextPage(context, index);
          },
          title: BodyText1Copy(data: _viewModel.items[index].name),
          subtitle: _buildSubtitle(context, index),
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
