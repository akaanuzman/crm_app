import 'package:boardview/boardview_controller.dart';
import 'package:crm_app/feature/profile/view/profile_view.dart';
import '../../../core/constants/app/app_constants.dart';
import '../projectdetail/view/project_detail_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

import '../../../core/components/row/row_icon_text.dart';
import '../../../core/components/row/row_space_between_text.dart';
import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import '../../../core/components/text/bold_text.dart';
import '../../../product/widgets/stack/blue_bar.dart';
import '../viewmodel/project_view_model.dart';

// ignore: must_be_immutable
class ProjectView extends StatefulWidget {
  ProjectView({Key? key}) : super(key: key);

  final ProjectViewModel _viewModel = ProjectViewModel();

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final BoardViewController boardViewController = BoardViewController();
  late final ProjectViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget._viewModel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projeler",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        automaticallyImplyLeading: false,
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

  Widget get _buildListViewBuilder => Observer(
      builder: (BuildContext context) => ListView.builder(
            itemCount: viewModel.items.projects?.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => _buildProjectCard(context, index),
          ));

  Widget _buildProjectCard(BuildContext context, int index) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    return Padding(
      padding: context.paddingLow,
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            color: context.colorScheme.primaryVariant,
            caption: 'Sil',
            icon: Icons.delete,
            onTap: () {
              _showDialog(context, index, radius);
            },
          ),
          IconSlideAction(
            color: context.colorScheme.onPrimary,
            foregroundColor: context.colorScheme.onSurface,
            caption: 'Düzenle',
            icon: Icons.edit,
            onTap: () {
              _showModalBottomSheet(context, radius);
            },
          ),
        ],
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          child: ListTile(
            onTap: () {
              goToNextPage(context, index);
            },
            title: Padding(
              padding: context.verticalPaddingLow,
              child: BodyText1Copy(
                  data: viewModel.items.projects?[index].name ?? ""),
            ),
            subtitle: _buildSubtitle(context, index),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context, int index) {
    ApplicationConstants.instance!.projectId =
        viewModel.items.projects?[index].id ?? "";
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRowIconText(index),
        context.emptySizedHeightBoxLow3x,
        Text(viewModel.items.projects?[index].detail ?? "Proje icerigi"),
        _buildRowIconTextText(context, index),
        SizedBox(
          height: context.dynamicHeight(0.05),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.items.projects?[index].users?.length,
            itemBuilder: (context, indexV2) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      debugPrint("${viewModel.items.projects?[indexV2].user_name} $indexV2");
                      return ProfileView(
                          username:
                              viewModel.items.projects?[indexV2].user_name ?? "",
                        );
                    }));
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://192.168.3.53/assets/images/users/${viewModel.items.projects?[index].users?[indexV2].photo}"),
              ),
            ),
          ),
        ),
        context.emptySizedHeightBoxLow3x,
        RowSpaceBetweenText(
          firstText: "Task complated: ",
          secondText:
              viewModel.items.projects?[index].okgorev.toString() ?? "0",
          thirthText:
              viewModel.items.projects?[index].allgorev.toString() ?? "0",
        ),
        context.emptySizedHeightBoxLow,
        BlueBar(
            width: viewModel.items.projects?[index] != null
                ? viewModel.items.projects![index].okgorev! /
                            viewModel.items.projects![index].allgorev! ==
                        1
                    ? 0
                    : viewModel.items.projects![index].okgorev! /
                                viewModel.items.projects![index].allgorev! ==
                            0.75
                        ? 0.2
                        : viewModel.items.projects![index].okgorev! /
                                    viewModel
                                        .items.projects![index].allgorev! ==
                                0.5
                            ? 0.345
                            : viewModel.items.projects![index].okgorev! /
                                        viewModel
                                            .items.projects![index].allgorev! ==
                                    0.25
                                ? 0.5
                                : 1
                : 0),
        context.emptySizedHeightBoxLow3x
      ],
    );
  }

  Widget _buildRowIconText(int index) => RowIconText(
        icon: Icons.account_circle_rounded,
        text: viewModel.items.projects?[index].user_name ?? "",
        sizedBox: const SizedBox(
          height: 0,
          width: 2,
        ),
      );

  Row _buildRowIconTextText(BuildContext context, int index) => Row(
        children: [
          const Icon(Icons.list),
          context.emptySizedWidthBoxLow,
          BoldText(
              data: viewModel.items.projects?[index].allgorev.toString() ?? ""),
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
          allTask: viewModel.items.projects?[index].allgorev ?? 0,
          okTask: viewModel.items.projects?[index].okgorev ?? 0,
          projectId: viewModel.items.projects?[index].id ?? "0",
        ),
      ),
    );
  }

  _showModalBottomSheet(context, double radius) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        builder: (BuildContext context) {
          return Container(
            height: context.dynamicHeight(0.48),
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
                context.emptySizedHeightBoxLow3x,
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
                            data: "Vazgeç",
                            color: context.colorScheme.onSurface),
                        style: ElevatedButton.styleFrom(
                            primary: context.colorScheme.secondaryVariant),
                      ),
                      context.emptySizedWidthBoxLow,
                      ElevatedButton(
                        onPressed: () {},
                        child: BodyText2Copy(
                            data: "Kaydet",
                            color: context.colorScheme.onSurface),
                        style: ElevatedButton.styleFrom(
                            primary: context.colorScheme.surface),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  _showDialog(BuildContext context, int index, double radius) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              title: const BodyText1Copy(
                  data: "Projenizi silmek istediğinizden emin misiniz ?"),
              content: const BodyText2Copy(
                  data: "Proje kalıcı olarak silinecektir."),
              actions: [
                ElevatedButton(
                  child: Text("Evet",
                      style: TextStyle(color: context.colorScheme.onSurface)),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.primaryVariant),
                  onPressed: () {
                    setState(() {
                      // widget._viewModel.deleteItem(index);
                    });
                    Navigator.of(context).pop();
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.secondaryVariant),
                  child: Text(
                    "Hayır",
                    style: TextStyle(color: context.colorScheme.onSurface),
                  ),
                )
              ],
            ));
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
                      data: "İptal", color: context.colorScheme.onSurface),
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
