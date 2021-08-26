import 'package:flutter/material.dart';

class BottomTabModel {
  final String title;
  final IconData icon;
  final Widget child;

  BottomTabModel(
      {required this.title, required this.icon, required this.child});
}
