// ignore_for_file: prefer_const_constructors

import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/components/text/bold_text.dart';
import 'package:crm_app/core/components/text/subtitle1_copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class CompanyHomeView extends StatelessWidget {
  const CompanyHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: context.dynamicHeight(2.5),
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.lowBorderRadius),
                    elevation: 5,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://192.168.3.54/crm-v4/dist/assets/media/stock-600x400/img-70.jpg"),
                                  ),
                                  borderRadius: context.normalBorderRadius),
                            ),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Text("Firma İsmi"),
                          context.emptySizedHeightBoxLow,
                          Text(
                            "Uzun isim",
                            style: context.textTheme.caption!.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.lowBorderRadius),
                    elevation: 5,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          BoldText(data: "Books to Pickup"),
                          context.emptySizedHeightBoxLow,
                          Text(
                            "24 Books to return",
                            style: context.textTheme.caption!.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => ListTile(
                                leading: Container(
                                  width: context.dynamicWidth(0.1),
                                  height: context.dynamicHeight(0.1),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          "http://192.168.3.54/crm-v4/dist/assets/media/books/4.png",
                                        ),
                                      ),
                                      borderRadius: context.lowBorderRadius),
                                ),
                                title: BodyText2Copy(data: "Darius The Great"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Subtitle1Copy(
                                      data:
                                          "Amazing Short Story About Darius greatness",
                                      color: Colors.grey,
                                    ),
                                    context.emptySizedHeightBoxLow,
                                    SizedBox(
                                      height: context.dynamicHeight(0.04),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("Book Now"),
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey.shade800),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors.grey
                                                    .withOpacity(0.2);
                                              }
                                              if (states.contains(
                                                      MaterialState.focused) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return Colors.black
                                                    .withOpacity(0.2);
                                              }
                                              return Colors
                                                  .red; // Defer to the widget's default.
                                            },
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey.shade300),
                                        ),
                                      ),
                                    ),
                                    context.emptySizedHeightBoxLow3x,
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.lowBorderRadius),
                    elevation: 5,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          BoldText(data: "Authors"),
                          context.emptySizedHeightBoxLow,
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => ListTile(
                                leading: Container(
                                  width: context.dynamicWidth(0.1),
                                  child: SvgPicture.network(
                                      "http://192.168.3.54/crm-v4/dist/assets/media/svg/avatars/009-boy-4.svg"),
                                  decoration: BoxDecoration(
                                      color: Color(0xffC9F7F5),
                                      borderRadius: context.lowBorderRadius),
                                ),
                                title: BodyText2Copy(data: "Ricky Hunt"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Subtitle1Copy(
                                      data: "PHP, SQLite, Artisan CLI",
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                trailing: Icon(Icons.more_horiz),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.lowBorderRadius),
                    elevation: 5,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText(data: "Personal Information"),
                          context.emptySizedHeightBoxLow,
                          Text(
                            "Update your personal informaiton",
                            style: context.textTheme.caption!.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Divider(
                            thickness: 2,
                          ),
                          context.emptySizedHeightBoxLow,
                          BoldText(data: "Customer Info"),
                          context.emptySizedHeightBoxLow3x,
                          Text(
                            "Avatar",
                            style: context.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          Stack(
                            children: [
                              Container(
                                height: context.dynamicHeight(0.1),
                                width: context.dynamicWidth(0.18),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "http://192.168.3.54/crm-v4/dist/assets/media/users/blank.png"),
                                        fit: BoxFit.fill),
                                    borderRadius: context.lowBorderRadius),
                              ),
                              Positioned(
                                left: 50,
                                top: 50,
                                bottom: 50,
                                right: 0,
                                child: Card(
                                  child: IconButton(
                                      onPressed: () {}, icon: Icon(Icons.edit)),
                                ),
                              ),
                            ],
                          ),
                          context.emptySizedHeightBoxLow,
                          Text(
                            "Allowed file types: png, jpg, jpeg.",
                            style: context.textTheme.caption!.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Padding(
                            padding: context.paddingLow,
                            child: Text(
                              "First Name :",
                              style: context.textTheme.caption!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          context.emptySizedHeightBoxLow,
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Please enter first name.',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onSecondary),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                          context.emptySizedHeightBoxLow3x,
                          Padding(
                            padding: context.paddingLow,
                            child: const Text("Last Name:"),
                          ),
                          context.emptySizedHeightBoxLow,
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Please enter last name.',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onSecondary),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
