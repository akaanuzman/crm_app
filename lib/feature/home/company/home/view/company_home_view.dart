// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CompanyHomeView extends StatelessWidget {
  const CompanyHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: context.dynamicHeight(1.85),
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        children: [
                          Image.network(
                              "http://192.168.3.54/crm-v4/dist/assets/media/stock-600x400/img-70.jpg"),
                          context.emptySizedHeightBoxLow3x,
                          Text("Firma İsmi"),
                          context.emptySizedHeightBoxLow,
                          Text("Uzun isim")
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Books to Pickup"),
                        context.emptySizedHeightBoxLow,
                        Text("24 Book to Return"),
                        context.emptySizedHeightBoxLow,
                        Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => ListTile(
                              // leading:  Image.network("http://192.168.3.54/crm-v4/dist/assets/media/books/4.png"),
                              leading: Container(
                                width: context.dynamicWidth(0.1),
                                height: context.dynamicHeight(0.5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("http://192.168.3.54/crm-v4/dist/assets/media/books/4.png",)),
                                  color: Colors.red,
                                ),
                              ),
                              title: Text("Darius The Great"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text("Amazing Short Story About Darius greatness"),
                                  ElevatedButton(onPressed: (){}, child: Text("Book Now"))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  color: Colors.red,
                )),
                Expanded(
                    child: Container(
                  color: Colors.orange,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
