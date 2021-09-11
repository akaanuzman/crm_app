import '../../../../core/components/text/body_text1_copy.dart';
import '../../../../core/components/text/body_text2_copy.dart';
import '../../../../core/components/text/bold_text.dart';
import '../../../../core/constants/app/app_constants.dart';

import '../viewmodel/profile/profile_view_model.dart';
import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geira_icons/geira_icons.dart';
import 'package:kartal/kartal.dart';



class ProfileView extends StatelessWidget {
  final ProfileViewModel _viewModel = ProfileViewModel();
  final String username;
  ProfileView({Key? key, required this.username}) : super(key: key) {
    _viewModel.fetchItems(ApplicationConstants.instance!.token, username);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Card(
          elevation: 3,
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: [
                context.emptySizedHeightBoxLow,
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(_viewModel.items.photo ??
                      ""),
                ),
                context.emptySizedHeightBoxLow,
                BodyText1Copy(data: _viewModel.items.full_name ?? ""),
                Text(_viewModel.items.user_name ?? ""),
                context.emptySizedHeightBoxLow,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: BodyText2Copy(
                          data: "Follow", color: context.colorScheme.onSurface),
                    ),
                    context.emptySizedWidthBoxLow,
                    ElevatedButton(
                      onPressed: () {},
                      child: BodyText2Copy(
                          data: "Message",
                          color: context.colorScheme.onSurface),
                      style: ElevatedButton.styleFrom(
                          primary: context.colorScheme.primaryVariant),
                    ),
                  ],
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: BoldText(data: "HAKKIMDA: "),
                      ),
                      context.emptySizedWidthBoxLow,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_viewModel.items.detail ?? ""),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tam isim:",
                          style: TextStyle(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      context.emptySizedWidthBoxLow,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_viewModel.items.full_name ?? ""),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    // ignore:
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Telefon :",
                          style: TextStyle(
                              color: context.colorScheme.onBackground,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      context.emptySizedWidthBoxLow,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_viewModel.items.telephone ??
                            "Geçerli telefon numarası bulunamadı."),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Eposta :",
                          style: TextStyle(
                              color: context.colorScheme.onBackground,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      context.emptySizedWidthBoxLow,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_viewModel.items.email ??
                            "Geçerli eposta adresi bulunamadi."),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Şirket :",
                          style: TextStyle(
                              color: context.colorScheme.onBackground,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      context.emptySizedWidthBoxLow,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(_viewModel.items.company_name ?? ""),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingNormal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          GIcons.instagram,
                          size: 48,
                          color: context.colorScheme.onSurface,
                        ),
                        backgroundColor: const Color(0xff9935B4),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          EvilIcons.sc_github,
                          size: 48,
                          color: context.colorScheme.onSurface,
                        ),
                        backgroundColor: context.colorScheme.secondaryVariant,
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          EvilIcons.sc_linkedin,
                          size: 48,
                          color: context.colorScheme.onSurface,
                        ),
                        backgroundColor: const Color(0xff0A66C2),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          EvilIcons.sc_twitter,
                          size: 48,
                          color: context.colorScheme.onSurface,
                        ),
                        backgroundColor: const Color(0xff1DA1F2),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          EvilIcons.sc_facebook,
                          size: 48,
                          color: context.colorScheme.onSurface,
                        ),
                        backgroundColor: const Color(0xff17A8FD),
                      ),
                      CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.language,
                          size: 48,
                          color: context.colorScheme.onSurface,
                        ),
                        backgroundColor: context.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
