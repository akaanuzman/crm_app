import '../contact_detail/view/contact_detail_guide_view.dart';

import '../../../core/constants/app/app_constants.dart';
import '../viewmodel/contact_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:popup_card/popup_card.dart';

import '../contact_detail/view/contact_detail_users_view.dart';

import '../../../core/components/text/body_text1_copy.dart';
import '../../../core/components/text/body_text2_copy.dart';
import '../../../core/components/textfield/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';

class ContactView extends StatelessWidget {
  final ContactViewModel _viewModel = ContactViewModel();
  ContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    _viewModel.fetchItems(ApplicationConstants.instance!.token);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kişileriniz",
          style: TextStyle(color: context.colorScheme.onSecondary),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'Proje Ekle',
        child: Material(
          color: context.colorScheme.primaryVariant,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
          child: Icon(
            Icons.add_rounded,
            size: 48,
            color: context.colorScheme.onSurface,
          ),
        ),
        popUp: PopUpItem(
          padding: EdgeInsets.zero,
          color: context.colorScheme.onSurface,
          shape:
              RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
          elevation: 2,
          tag: 'Proje Ekle',
          child: const PopUpItemBody(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(
        builder: (context) => Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 2, child: SearchTextField()),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.horizontalPaddingNormal,
                child: const Text("Sisteme kayıtlı olan kişiler"),
              ),
              context.emptySizedHeightBoxLow,
              Expanded(
                flex: 12,
                child: ListView.builder(
                  itemCount: _viewModel.items.users?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                  // ignore: prefer_const_constructors
                  itemBuilder: (context, index) => Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actions: [
                      IconSlideAction(
                        color: context.colorScheme.primaryVariant,
                        caption: 'Sil',
                        icon: Icons.delete,
                        onTap: () {
                          _showDialog(context, radius);
                        },
                      ),
                      IconSlideAction(
                        color: context.colorScheme.onPrimary,
                        foregroundColor: context.colorScheme.onSurface,
                        caption: 'Düzenle',
                        icon: Icons.edit,
                        onTap: () {
                          _showModalBottomSheet(context, radius);
                          debugPrint(_viewModel.items.message);
                        },
                      ),
                    ],
                    child: Padding(
                      padding: context.paddingLow,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius),
                        elevation: 5,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ContactUsersDetailView(
                                  user: _viewModel.items.users?[index],
                                ),
                              ),
                            );
                          },
                          title: BodyText2Copy(
                              data: _viewModel.items.users?[index].full_name ??
                                  ""),
                          subtitle: Text(
                            _viewModel.items.users?[index].email ?? "",
                            style: context.textTheme.button,
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://192.168.3.53/assets/images/users/${_viewModel.items.users?[index].photo}"),
                            radius: 30,
                          ),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.horizontalPaddingNormal,
                child: const Text("Sisteme kayıtlı olmayan kişiler"),
              ),
              context.emptySizedHeightBoxLow,
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: _viewModel.items.guides?.length ?? 0,
                  physics: const BouncingScrollPhysics(),
                  // ignore: prefer_const_constructors
                  itemBuilder: (context, index) => Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actions: [
                      IconSlideAction(
                        color: context.colorScheme.primaryVariant,
                        caption: 'Sil',
                        icon: Icons.delete,
                        onTap: () {
                          _showDialog(context, radius);
                        },
                      ),
                      IconSlideAction(
                        color: context.colorScheme.onPrimary,
                        foregroundColor: context.colorScheme.onSurface,
                        caption: 'Düzenle',
                        icon: Icons.edit,
                        onTap: () {
                          _showModalBottomSheet(context, radius);
                          debugPrint(_viewModel.items.message);
                        },
                      ),
                    ],
                    child: Padding(
                      padding: context.paddingLow,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius),
                        elevation: 5,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ContactGuidesDetailView(
                                  guides: _viewModel.items.guides?[index],
                                ),
                              ),
                            );
                          },
                          title: BodyText2Copy(
                              data: _viewModel.items.guides?[index].name ?? ""),
                          subtitle: Text(
                            _viewModel.items.guides?[index].email ?? "",
                            style: context.textTheme.button,
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://192.168.3.53/assets/images/users/${_viewModel.items.guides?[index].photo}"),
                            radius: 30,
                          ),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.horizontalPaddingNormal,
                child:
                    const Text("Kişiyi silmek veya düzenlemek için sağa kaydırınız."),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet(context, double radius) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return Container(
          height: context.dynamicHeight(0.46),
          padding: context.paddingNormal,
          decoration: BoxDecoration(
            color: context.colorScheme.onSurface,
            borderRadius: BorderRadius.only(
              topLeft: context.highadius,
              topRight: context.highadius,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: context.dynamicWidth(0.03),
                  width: context.dynamicWidth(0.2),
                  decoration: BoxDecoration(
                      borderRadius: context.lowBorderRadius,
                      color: context.colorScheme.background),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.paddingLow,
                child: const Text("Kişi"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Kişinin ismi',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide:
                        BorderSide(color: context.colorScheme.onBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: context.colorScheme.surface),
                  ),
                ),
                cursorColor: context.colorScheme.onSecondary,
              ),
              context.emptySizedHeightBoxLow,
              Padding(
                padding: context.paddingLow,
                child: const Text("Email"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Kişinin emaili',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide:
                        BorderSide(color: context.colorScheme.onBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: context.lowBorderRadius,
                    borderSide: BorderSide(color: context.colorScheme.surface),
                  ),
                ),
                cursorColor: context.colorScheme.onSecondary,
              ),
              context.emptySizedHeightBoxLow3x,
              Divider(
                color: context.colorScheme.secondaryVariant,
                thickness: 0.4,
              ),
              Padding(
                padding: context.paddingLow,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: BodyText2Copy(
                          data: "Vazgeç", color: context.colorScheme.onSurface),
                      style: ElevatedButton.styleFrom(
                          primary: context.colorScheme.secondaryVariant),
                    ),
                    context.emptySizedWidthBoxLow,
                    ElevatedButton(
                      onPressed: () {},
                      child: BodyText2Copy(
                          data: "Kaydet", color: context.colorScheme.onSurface),
                      style: ElevatedButton.styleFrom(
                          primary: context.colorScheme.surface),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _showDialog(BuildContext context, double radius) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              title: const BodyText1Copy(
                  data: "Kişiyi silmek istediğinizden emin misiniz ?"),
              content:
                  const BodyText2Copy(data: "Kişi kalıcı olarak silinecektir."),
              actions: [
                ElevatedButton(
                  child: Text("Evet",
                      style: TextStyle(color: context.colorScheme.onSurface)),
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.surface),
                  onPressed: () {
                    // setState(() {
                    //   widget._viewModel.deleteItem(index);
                    // });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.colorScheme.secondaryVariant,
                        duration: context.durationSlow,
                        content: BodyText2Copy(
                          data: "Kişi başarıyla silindi !",
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: context.colorScheme.secondaryVariant),
                  child: Text(
                    "Hayır",
                    style: TextStyle(color: context.colorScheme.onSurface),
                  ),
                )
              ],
            ));
  }
}

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: context.colorScheme.primaryVariant,
                  child: Icon(
                    Icons.close,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: context.paddingLow,
                  child: const BodyText1Copy(data: "Kişi Ekle")),
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("İsim"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Kişinin ismini giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.paddingLow,
              child: const Text("Eposta"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Eposta giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            Padding(
              padding: context.paddingLow,
              child: const Text("Telefon"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Telefon giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("Hakkında"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Hakkında giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
              maxLines: 2,
            ),
            Padding(
              padding: context.paddingLow,
              child: const Text("Meslek"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Meslek giriniz.',
                enabledBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide:
                      BorderSide(color: context.colorScheme.onBackground),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: context.lowBorderRadius,
                  borderSide: BorderSide(color: context.colorScheme.surface),
                ),
              ),
              cursorColor: context.colorScheme.onSecondary,
            ),
            context.emptySizedHeightBoxLow,
            context.emptySizedHeightBoxLow,
            Divider(
              color: context.colorScheme.secondaryVariant,
              thickness: 0.4,
            ),
            Padding(
              padding: context.paddingLow,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: BodyText2Copy(
                        data: "Vazgeç", color: context.colorScheme.onSurface),
                    style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.secondaryVariant),
                  ),
                  context.emptySizedWidthBoxLow,
                  ElevatedButton(
                    onPressed: () {},
                    child: BodyText2Copy(
                        data: "Ekle", color: context.colorScheme.onSurface),
                    style: ElevatedButton.styleFrom(
                        primary: context.colorScheme.surface),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
