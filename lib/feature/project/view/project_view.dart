import 'dart:convert';

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/bold_text.dart';
import 'package:crm_app/feature/model/model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;

import '../../projectdetail/view/project_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    var db = Mysql();
    var mail = '';

    Future<void> getCustomer() async {
      debugPrint("gggggg");
      await db.getConnection().then((conn) {
        String sql = 'select * from company';
        conn.query(sql).then((results) {
          for (var row in results) {
            debugPrint("fgfgffgfgf");
            debugPrint(row[0]);
            setState(() {
              // mail = row;
              debugPrint(row[0]);
            });
          }
        });
        conn.close();
      });
    }

    Future<void> name() async {
      final response =
          await http.post(Uri.parse("http://192.168.3.53/index.php"));

      var dataUser = await jsonDecode(response.body);

      debugPrint("statement");
      debugPrint(dataUser.toString());
    }

    return Scaffold(
      body: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: getCustomer,
                child: Text(
                  "Proje Ekle",
                  style: context.textTheme.bodyText1!
                      .copyWith(color: context.colorScheme.onSurface),
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 12,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProjecetDetailView()));
                    },
                    title: const BodyText1Copy(data: "Proje Adı"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.account_circle_rounded),
                            context.emptySizedWidthBoxLow,
                            const Text(
                              "Ahmet Kaan Uzman",
                            ),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        const Text(
                          "Proje içeriği",
                        ),
                        Row(
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
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              child: Text("AA"),
                            ),
                            context.emptySizedWidthBoxLow,
                            const CircleAvatar(
                              child: Text("BU "),
                            ),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Task complated: ",
                            ),
                            const Text(
                              "3/4",
                            ),
                          ],
                        ),
                        context.emptySizedHeightBoxLow,
                        Stack(
                          children: [
                            const Divider(
                              thickness: 15,
                            ),
                            Divider(
                              thickness: 15,
                              color: context.colorScheme.surface,
                              endIndent: context.dynamicWidth(0.2),
                            ),
                          ],
                        ),
                        context.emptySizedHeightBoxLow3x
                      ],
                    ),
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
