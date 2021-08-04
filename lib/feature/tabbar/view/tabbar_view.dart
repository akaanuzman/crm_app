import 'package:flutter/material.dart';

class TabBarView extends StatelessWidget {
  final int lenght;
  final AppBar? appbar;
  final Widget? body;
  final Widget? drawer;

  const TabBarView(
      {Key? key, required this.lenght, this.appbar, this.drawer, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: lenght,
      child: Scaffold(
        appBar: appbar,
        body: body,
        drawer: drawer,
      ),
    );
  }
}
