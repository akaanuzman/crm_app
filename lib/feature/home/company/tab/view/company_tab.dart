// ignore_for_file: prefer_const_constructors

import 'package:crm_app/feature/home/company/home/view/company_home_view.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CompanyTab extends StatefulWidget {
  const CompanyTab({Key? key}) : super(key: key);

  @override
  State<CompanyTab> createState() => _CompanyViewV2State();
}

class _CompanyViewV2State extends State<CompanyTab> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    CompanyHomeView(),
        Center(
      child: Text("Ayarlar"),
    ),
        Center(
      child: Text("Takvim"),
    ),
        Center(
      child: Text("Çalışanlar"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        items: [
          SalomonBottomBarItem(
            selectedColor: Color(0xff8950FC),
            unselectedColor: Color(0xff8950FC),
            icon: Icon(
              Icons.home,
            ),
            title: Text("Ana Sayfa"),
          ),
          SalomonBottomBarItem(
            selectedColor: Color(0xff663259),
            unselectedColor: Color(0xff663259),
            icon: Icon(
              Icons.settings,
            ),
            title: Text("Ayarlar"),
          ),
          SalomonBottomBarItem(
            selectedColor: Color(0xff1BC5BD),
            unselectedColor: Color(0xff1BC5BD),
            icon: Icon(Icons.access_time),
            title: Text("Takvim"),
          ),
          SalomonBottomBarItem(
              selectedColor: Color(0xffF64E60),
              unselectedColor: Color(0xffF64E60),
              icon: Icon(
                Icons.person,
              ),
              title: Text("Çalışanlar")),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
      body: tabs[_currentIndex],
    );
  }
}
