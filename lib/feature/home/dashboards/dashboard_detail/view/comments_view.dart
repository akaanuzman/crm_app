// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onSurface,
      appBar: AppBar(
        title: const Text("Yorumlar"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: index % 2 == 0
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  index % 2 == 0
                      ? Row(
                          children: [
                            context.emptySizedWidthBoxLow3x,
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                index == 0
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            top: context.normalValue),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "http://192.168.3.53/assets/images/users/user0.jpg"),
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "http://192.168.3.53/assets/images/users/user0.jpg"),
                                      ),
                                context.emptySizedHeightBoxLow,
                                Text("datetime")
                              ],
                            ),
                            Container(
                              margin: context.paddingLow,
                              padding: context.paddingNormal,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text("Dışarıdan Erişim"),
                                  Text("message")
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffF9F7E8),
                                  borderRadius:
                                      BorderRadius.circular(context.lowValue)),
                            ),
                          ],
                        )
                      : Container(
                          margin: context.paddingLow,
                          padding: context.paddingNormal,
                          child: Column(
                            children: [
                              Text("Username"),
                              context.emptySizedHeightBoxLow,
                              Text("content"),
                              context.emptySizedHeightBoxLow,
                              Text("datetime"),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffFFDFD3),
                              borderRadius:
                                  BorderRadius.circular(context.lowValue)),
                        ),
                ],
              ),
            ),
          ),
          Container(
            color: context.colorScheme.secondaryVariant,
            padding: context.paddingLow,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: context.colorScheme.onSurface,
                        borderRadius: BorderRadius.all(context.lowRadius)),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.chat),
                        hintText: 'Lütfen mesajınızı buraya giriniz.',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: context.colorScheme.onBackground),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: context.colorScheme.surface),
                        ),
                      ),
                      cursorColor: context.colorScheme.onSecondary,
                    ),
                  ),
                ),
                context.emptySizedWidthBoxLow3x,
                SizedBox(
                  height: context.dynamicHeight(0.07),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
