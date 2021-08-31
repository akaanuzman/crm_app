// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/bold_text.dart';
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
          height: context.dynamicHeight(1.8),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                BodyText1Copy(
                  data: "Katmanlar",
                  fontWeight: FontWeight.bold,
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
                      child: LineChart(LineChartData(
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
                            getTextStyles: (context, value) => const TextStyle(
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
                            getTextStyles: (context, value) => const TextStyle(
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
                      )),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 2,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(context.mediumValue, context.mediumValue, context.mediumValue, context.lowValue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              BoldText(data: "İsim"),
                              BoldText(data: "Aktif Görev"),
                            ],
                          ),
                        ),
                        context.emptySizedHeightBoxLow,
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                color: index % 2 == 0 ? context.colorScheme.onSurface : context.colorScheme.secondary,
                                child: ListTile(
                                  leading: Icon(Icons.task),
                                  title: Text("data"),
                                  trailing: Text("300")
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
}
