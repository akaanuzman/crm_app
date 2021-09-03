// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/feature/home/bottomtab/model/bottomtab_model.dart';
import 'package:crm_app/feature/home/dashboards/dashboard_detail/view/access_view.dart';
import 'package:crm_app/feature/home/dashboards/dashboard_detail/view/comments_view.dart';
import 'package:crm_app/feature/home/dashboards/dashboard_detail/view/log_records_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DashboardDetailView extends StatelessWidget {
  const DashboardDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "http://192.168.3.53/assets/images/logo-light.png",
          width: context.dynamicWidth(0.28),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: context.dynamicHeight(2.2),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BodyText1Copy(
                      data: "Katmanlar",
                      fontWeight: FontWeight.bold,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showModalBottomSheet(context, context.lowValue);
                      },
                      child: Icon(
                        Icons.settings,
                        color: context.colorScheme.onSurface,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.secondaryVariant,
                      ),
                    ),
                  ],
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: context.paddingNormal,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              color: context.colorScheme.primaryVariant,
                              value: 30,
                              title: "30",
                              radius: 60,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            PieChartSectionData(
                              color: context.colorScheme.onPrimary,
                              value: 40,
                              title: "40",
                              radius: 80,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            PieChartSectionData(
                              color: context.colorScheme.onError,
                              value: 50,
                              title: "50",
                              radius: 100,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            // PieChartSectionData(
                            //   color: context.colorScheme.error,
                            //   value: 25,
                            //   title: "25",
                            //   radius: 50,
                            //   titleStyle:
                            //       TextStyle(color: context.colorScheme.onSurface),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: context.paddingNormal,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 0,
                          sections: [
                            PieChartSectionData(
                              color: context.colorScheme.primaryVariant,
                              value: 30,
                              title: "30",
                              radius: 100,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            PieChartSectionData(
                              color: context.colorScheme.onPrimary,
                              value: 40,
                              title: "40",
                              radius: 100,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            PieChartSectionData(
                              color: context.colorScheme.onError,
                              value: 50,
                              title: "50",
                              radius: 100,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                            PieChartSectionData(
                              color: context.colorScheme.error,
                              value: 25,
                              title: "25",
                              radius: 100,
                              titleStyle: TextStyle(
                                  color: context.colorScheme.onSurface),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: context.paddingNormal,
                      child: BarChart(
                        BarChartData(
                          barGroups: [
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(y: 1, colors: [
                                  context.colorScheme.primaryVariant,
                                ]),
                                BarChartRodData(y: 2, colors: [
                                  context.colorScheme.primaryVariant,
                                ]),
                                BarChartRodData(y: 3, colors: [
                                  context.colorScheme.primaryVariant,
                                ]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(y: 4, colors: [
                                  context.colorScheme.onPrimary,
                                ]),
                                BarChartRodData(y: 5, colors: [
                                  context.colorScheme.onPrimary,
                                ]),
                                BarChartRodData(y: 6, colors: [
                                  context.colorScheme.onPrimary,
                                ]),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(y: -1),
                                BarChartRodData(y: -2),
                                BarChartRodData(y: -3),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Padding(
                      padding: context.paddingNormal,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            // getDrawingHorizontalLine: (value) {
                            //   return FlLine(
                            //     color: const Color(0xff37434d),
                            //     strokeWidth: 1,
                            //   );
                            // },
                            // getDrawingVerticalLine: (value) {
                            //   return FlLine(
                            //     color: const Color(0xff37434d),
                            //     strokeWidth: 1,
                            //   );
                            // },
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: SideTitles(showTitles: false),
                            topTitles: SideTitles(showTitles: false),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              interval: 1,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                      color: Color(0xff68737d),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 2:
                                    return 'Çalışanlar';
                                  case 5:
                                    return 'Görevler';
                                  case 8:
                                    return 'Kişiler';
                                }
                                return '';
                              },
                              margin: 8,
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTextStyles: (context, value) =>
                                  const TextStyle(
                                color: Color(0xff67727d),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 1:
                                    return '500';
                                  case 3:
                                    return '300';
                                  case 5:
                                    return '200';
                                }
                                return '';
                              },
                              reservedSize: 32,
                              margin: 12,
                            ),
                          ),
                          minX: 0,
                          maxX: 11,
                          minY: 0,
                          maxY: 6,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(2.6, 2),
                                FlSpot(4.9, 5),
                                FlSpot(6.8, 3),
                                FlSpot(8, 4),
                                FlSpot(9.5, 3),
                                FlSpot(11, 4),
                              ],
                              isCurved: true,
                              colors: gradientColors,
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: gradientColors
                                    .map((color) => color.withOpacity(0.3))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: DataTable(
                          columns: [
                            DataColumn(label: BodyText2Copy(data: "İsim")),
                            DataColumn(
                                label: BodyText2Copy(data: "Aktif Görev"))
                          ],
                          rows: List.generate(
                            4,
                            (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index % 2 == 0
                                        ? context.colorScheme.secondary
                                        : context.colorScheme.onSurface),
                                cells: [
                                  DataCell(Text("data")),
                                  DataCell(Text("data")),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(context, double radius) {
    final List<BottomTabModel> items = [
      BottomTabModel(
          title: "Yorumlar", icon: Icons.comment, child: CommentsView()),
      BottomTabModel(
          title: "Erişim Sahipleri", icon: Icons.people, child: AccesView()),
      BottomTabModel(
          title: "Ayarlar", icon: Icons.settings, child: const Scaffold()),
      BottomTabModel(
          title: "Log Kayıtları",
          icon: Icons.save,
          child: const LogRecordsView()),
    ];
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        builder: (BuildContext context) {
          return DefaultTabController(
            length: items.length,
            child: Scaffold(
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  color: context.colorScheme.secondaryVariant,
                  child: TabBar(
                    labelPadding: context.horizontalPaddingLow,
                    tabs: List.generate(
                      items.length,
                      (index) => Tab(
                        text: items[index].title,
                        icon: Icon(items[index].icon),
                      ),
                    ),
                  ),
                ),
              ),
              body: TabBarView(children: items.map((e) => e.child).toList()),
            ),
          );
        });
  }
}
