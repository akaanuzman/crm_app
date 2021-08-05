import '../../../../core/components/text/body_text1_copy.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SendMailView extends StatelessWidget {
  const SendMailView({Key? key}) : super(key: key);

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
        child: SizedBox(
          height: context.dynamicHeight(1.45),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: context.paddingNormal,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.lowValue),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                                padding: context.paddingLow,
                                child: const BodyText1Copy(data: "Kişilerim")),
                          ),
                          context.emptySizedHeightBoxLow,
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Kişi ismi giriniz.',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                          context.emptySizedHeightBoxLow,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: context.paddingNormal,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.lowValue),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                                padding: context.paddingLow,
                                child: const BodyText1Copy(
                                    data: "Kayıtlı olmayan eposta ekle")),
                          ),
                          context.emptySizedHeightBoxLow,
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Kişinin adi soyadini giriniz.',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                          context.emptySizedHeightBoxLow3x,
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Kişinin emailini giriniz.',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                          context.emptySizedHeightBoxLow,
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Kişilerime Ekle",
                                style: TextStyle(
                                    color: context.colorScheme.onSurface),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: context.paddingNormal,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.lowValue),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          context.emptySizedHeightBoxLow,
                          Padding(
                            padding: context.paddingLow,
                            child: const Text("Başlık"),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Kişinin adi soyadini giriniz.',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                          ),
                          context.emptySizedHeightBoxLow,
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'İçerik',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.onBackground),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: context.lowBorderRadius,
                                borderSide: BorderSide(
                                    color: context.colorScheme.surface),
                              ),
                            ),
                            cursorColor: context.colorScheme.onSecondary,
                            maxLines: 16,
                          ),
                          context.emptySizedHeightBoxLow,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: context.horizontalPaddingMedium,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Eposta Gönder",
                      style: TextStyle(color: context.colorScheme.onSurface),
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow,
            ],
          ),
        ),
      ),
    );
  }
}
