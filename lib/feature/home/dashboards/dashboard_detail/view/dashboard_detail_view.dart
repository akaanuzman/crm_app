// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DashboardDetailView extends StatelessWidget {
  const DashboardDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: context.dynamicHeight(1.6),
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
                  child: Card(
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: context.colorScheme.primaryVariant,
                            value: 25,
                            title: "25",
                            titleStyle:
                                TextStyle(color: context.colorScheme.onSurface),
                          ),
                          PieChartSectionData(
                            color: context.colorScheme.onPrimary,
                            value: 25,
                            title: "25",
                            titleStyle:
                                TextStyle(color: context.colorScheme.onSurface),
                          ),
                          PieChartSectionData(
                            color: context.colorScheme.onError,
                            value: 25,
                            title: "25",
                            titleStyle:
                                TextStyle(color: context.colorScheme.onSurface),
                          ),
                          PieChartSectionData(
                            color: context.colorScheme.error,
                            value: 25,
                            title: "25",
                            titleStyle:
                                TextStyle(color: context.colorScheme.onSurface),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
