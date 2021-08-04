import 'package:flutter/material.dart';

class TabBarModel {
  final String title;
  final IconData icon;
  final Widget child;

  TabBarModel(
      {required this.title, required this.icon, required this.child});
}
