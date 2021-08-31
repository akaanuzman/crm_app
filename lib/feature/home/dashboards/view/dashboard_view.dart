// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/components/row/row_icon_text.dart';
import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/bold_text.dart';
import 'package:crm_app/feature/home/dashboards/dashboard_detail/view/dashboard_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Katmanlar",
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
            const Text("Katmanları silmek için sağa kaydırın.")
          ],
        ),
      ),
    );
  }

  Widget get _buildListViewBuilder => ListView.builder(
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => _buildProjectCard(context, index),
      );

  Widget _buildProjectCard(BuildContext context, int index) => Padding(
        padding: context.paddingLow,
        child: Slidable(
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
              foregroundColor: context.colorScheme.onSurface,
              caption: 'Düzenle',
              icon: Icons.edit,
              onTap: () {},
            ),
          ],
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: context.normalBorderRadius),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DashboardDetailView()));
              },
              title: Padding(
                padding: context.verticalPaddingLow,
                child: BodyText1Copy(data: "Katman ismi"),
              ),
              subtitle: _buildSubtitle(context, index),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ),
      );

  Widget _buildSubtitle(BuildContext context, int index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRowIconText(index),
          context.emptySizedHeightBoxLow3x,
          Text("Katman içeriği"),
          Row(
            children: [
              _buildRowIconTextText(
                  context, index, Icons.list, "0", "Alt Katman"),
              context.emptySizedWidthBoxLow3x,
              _buildRowIconTextText(
                  context, index, Icons.chat_bubble_outline, "0", "Yorum"),
            ],
          ),
          SizedBox(
            height: context.dynamicHeight(0.05),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, indexV2) {
                return GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://192.168.3.53/assets/images/users/user0.jpg"),
                  ),
                );
              },
            ),
          ),
          context.emptySizedHeightBoxLow3x,
        ],
      );

  Widget _buildRowIconText(int index) => RowIconText(
        icon: Icons.account_circle_rounded,
        text: "Kullanıcı adı",
        sizedBox: const SizedBox(
          height: 0,
          width: 2,
        ),
      );

  Row _buildRowIconTextText(BuildContext context, int index, IconData icon,
          String firstData, String secondData) =>
      Row(
        children: [
          Icon(icon),
          context.emptySizedWidthBoxLow,
          BoldText(data: firstData),
          context.emptySizedWidthBoxLow,
          Text(
            secondData,
          ),
          context.emptySizedHeightBoxHigh
        ],
      );
}
