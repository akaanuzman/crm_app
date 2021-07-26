import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class MailModel extends StatelessWidget {
  final String content;

  const MailModel({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final DateTime today = DateTime(time.year, time.month, time.day);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gelen Kutusu",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Card(
        child: Column(
          children: [
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemBuilder: (context, index) => Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actions: [
                    IconSlideAction(
                      color: context.colorScheme.primaryVariant,
                      caption: 'Sil',
                      icon: Icons.delete,
                      onTap: () {
                        // setState(() {
                        //   widget._viewModel.deleteItem(index);
                        // });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                context.colorScheme.secondaryVariant,
                            duration: context.durationSlow,
                            content: BodyText2Copy(
                              data: "Mail başarıyla silindi !",
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        );
                      },
                    ),
                    IconSlideAction(
                        color: context.colorScheme.onError,
                        foregroundColor: context.colorScheme.onSurface,
                        caption: 'Ertele',
                        icon: Icons.alarm,
                        onTap: () {}),
                  ],
                  secondaryActions: [
                    IconSlideAction(
                      color: context.colorScheme.surface,
                      foregroundColor: context.colorScheme.onSurface,
                      caption: 'Okundu',
                      icon: Icons.mark_email_read,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      color: context.colorScheme.secondaryVariant,
                      foregroundColor: context.colorScheme.onSurface,
                      caption: 'Okunmadı',
                      icon: Icons.mark_email_unread,
                      onTap: () {},
                    ),
                  ],
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.star_border_outlined),
                      title: Text(content),
                      trailing: Text(today.toString().substring(0, 10)),
                    ),
                  ),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow3x,
            Padding(
              padding: context.paddingNormal,
              child: const Text(
                "Projeleri silmek veya düzenlemek için sağa okundu veya okunmadı olarak işaretlemek için sola kaydırın.",
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
