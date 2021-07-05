import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Proje Ekle",
                style: context.textTheme.bodyText1,
              ),
            ),
          ),
          Expanded(
              flex: 12,
              child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                        child: ListTile(
                          title: const Text(
                            "Proje Adı",
                            // ignore: unnecessary_const
                            style: const TextStyle(color: Colors.black),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.account_circle_rounded),
                                  context.emptySizedWidthBoxLow,
                                  Text(
                                    "Ahmet Kaan Uzman",
                                    style: TextStyle(
                                        color: context.colorScheme.onSecondary),
                                  )
                                ],
                              ),
                              Text(
                                "Proje içeriği",
                                style: TextStyle(
                                    color: context.colorScheme.onSecondary),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.list),
                                  context.emptySizedWidthBoxLow,
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        color: context.colorScheme.onSecondary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  context.emptySizedWidthBoxLow,
                                  Text(
                                    "Görev",
                                    style: TextStyle(
                                      color: context.colorScheme.onSecondary,
                                    ),
                                  ),
                                  context.emptySizedHeightBoxHigh
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Text("AA"),
                                  ),
                                  context.emptySizedWidthBoxLow,
                                  CircleAvatar(
                                    child: Text("BU "),
                                  ),
                                ],
                              ),
                              context.emptySizedHeightBoxLow3x,
                              Text("Task complated: ",
                                  style: TextStyle(
                                      color: context.colorScheme.onSecondary),),
                                      context.emptySizedHeightBoxLow3x,
                                      LinearProgressIndicator(),
                                      context.emptySizedHeightBoxLow3x
                            ],
                          ),
                        ),
                      )))
        ],
      ),
    ));
  }
}
