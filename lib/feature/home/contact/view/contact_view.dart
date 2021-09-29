// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:crm_app/core/components/text/body_text1_copy.dart';
import 'package:crm_app/core/components/text/body_text2_copy.dart';
import 'package:crm_app/core/constants/app/app_constants.dart';
import 'package:crm_app/core/init/theme/light/color_scheme_light.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:popup_card/popup_card.dart';

import '../contact_detail/view/contact_detail_guide_view.dart';
import '../contact_detail/view/contact_detail_users_view.dart';
import '../viewmodel/contact_view_model.dart';

class ContactView extends StatefulWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final ContactViewModel _viewModel = ContactViewModel();
  final imagePicker = ImagePicker();
  String _image = "";

  Future<void> pickImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image!.path.substring(39);
    });

    debugPrint(_image);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    double height = mediaQuery.size.height;

    double radius = height * 0.02;

    _viewModel.fetchItems(ApplicationConstants.instance!.token);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kişi Yönetimi",
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
          child: PopUpItemBody(
            viewModel: _viewModel,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(
        builder: (context) => Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.horizontalPaddingLow,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Arama',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: context.colorScheme.surface),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                flex: 5,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: context.lowBorderRadius),
                  child: Padding(
                    padding: context.paddingLow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              context.normalValue,
                              context.lowValue,
                              context.normalValue,
                              context.lowValue),
                          child: const Text("Sisteme kayıtlı olan kişiler"),
                        ),
                        context.emptySizedHeightBoxLow,
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            itemCount: _viewModel.items.users?.length ?? 0,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: context.paddingLow,
                              child: Card(
                                color: context.colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: context.lowBorderRadius),
                                elevation: 5,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ContactUsersDetailView(
                                          user: _viewModel.items.users?[index],
                                        ),
                                      ),
                                    );
                                  },
                                  title: BodyText2Copy(
                                      data: _viewModel
                                              .items.users?[index].full_name ??
                                          ""),
                                  subtitle: Text(
                                    _viewModel.items.users?[index].email ?? "",
                                    style: context.textTheme.button,
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(_viewModel
                                            .items.users?[index].photo ??
                                        "http://192.168.3.53/assets/images/users/user0.jpg"),
                                    radius: 30,
                                  ),
                                  trailing: const Icon(Icons.more_vert),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Expanded(
                flex: 4,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: context.lowBorderRadius),
                  child: Padding(
                    padding: context.paddingLow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              context.normalValue,
                              context.lowValue,
                              context.normalValue,
                              context.lowValue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text("Sisteme kayıtlı olmayan kişiler"),
                              ElevatedButton(
                                onPressed: () {
                                  debugPrint("statement");
                                },
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(
                                      Icons.person_add,
                                      color: ColorSchemeLight.instance.java,
                                    ),
                                    context.emptySizedWidthBoxLow,
                                    Text(
                                      "Kişi Ekle",
                                      style: TextStyle(
                                        color: ColorSchemeLight.instance.java,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      ColorSchemeLight.instance.hummingBird,
                                  shadowColor: ColorSchemeLight.instance.java,
                                ),
                              )
                            ],
                          ),
                        ),
                        context.emptySizedHeightBoxLow,
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            itemCount: _viewModel.items.guides?.length ?? 0,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Observer(
                              builder: (context) => Slidable(
                                actionPane: const SlidableDrawerActionPane(),
                                actions: [
                                  IconSlideAction(
                                    color: context.colorScheme.primaryVariant,
                                    caption: 'Sil',
                                    icon: Icons.delete,
                                    onTap: () {
                                      // CoolAlert.show(
                                      //   context: context,
                                      //   type: CoolAlertType.info,
                                      //   title: "",
                                      //   text:
                                      //       'Kişi silmek istediğinizden emin misiniz ?\n Kişi kalıcı olarak',
                                      //   loopAnimation: false,
                                      //   cancelBtnText: "Hayır",
                                      //   showCancelBtn: true,
                                      //   confirmBtnColor:
                                      //       context.colorScheme.primaryVariant,
                                      // );
                                      _showDialog(
                                          context, radius, _viewModel, index);
                                    },
                                  ),
                                  IconSlideAction(
                                    color: context.colorScheme.onPrimary,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    caption: 'Düzenle',
                                    icon: Icons.edit,
                                    onTap: () {
                                      _showModalBottomSheet(
                                          context, radius, index);
                                      debugPrint(_viewModel.items.message);
                                    },
                                  ),
                                ],
                                secondaryActions: [
                                  IconSlideAction(
                                    color: context.colorScheme.onError,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    caption: 'Ara',
                                    icon: Icons.call,
                                    onTap: () {
                                      _showModalBottomSheet(
                                          context, radius, index);
                                      debugPrint(_viewModel.items.message);
                                    },
                                  ),
                                  IconSlideAction(
                                    color: context.colorScheme.background,
                                    foregroundColor:
                                        context.colorScheme.onSurface,
                                    caption: 'Mesaj',
                                    icon: Icons.message,
                                    onTap: () {
                                      _showModalBottomSheet(
                                          context, radius, index);
                                      debugPrint(_viewModel.items.message);
                                    },
                                  ),
                                ],
                                child: Padding(
                                  padding: context.paddingLow,
                                  child: Card(
                                    color: context.colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: context.lowBorderRadius),
                                    elevation: 5,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContactGuidesDetailView(
                                              guides: _viewModel
                                                  .items.guides?[index],
                                            ),
                                          ),
                                        );
                                      },
                                      title: BodyText2Copy(
                                          data: _viewModel
                                                  .items.guides?[index].name ??
                                              ""),
                                      subtitle: Text(
                                        _viewModel.items.guides?[index].email ??
                                            "",
                                        style: context.textTheme.button,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(_viewModel
                                                .items.guides?[index].photo ??
                                            "http://192.168.3.53/assets/images/users/user0.jpg"),
                                        radius: 30,
                                      ),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_right),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.horizontalPaddingNormal,
                child: const Text(
                    "Kişiyi silmek veya düzenlemek için sağa kaydırınız."),
              )
            ],
          ),
        ),
      ),
    );
  }
  

  _showModalBottomSheet(context, double radius, int index) {
    var nameController = TextEditingController();

    var eMailController = TextEditingController();

    var phoneController = TextEditingController();

    var detailController = TextEditingController();

    var jobController = TextEditingController();

    var birthDayController = TextEditingController();

    var webSiteController = TextEditingController();

    var locationController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: context.dynamicHeight(1.3),
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
                context.emptySizedHeightBoxLow3x,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Kişi"),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Kişinin ismi',
                    labelText: "İsim",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
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
                  keyboardType: TextInputType.emailAddress,
                  controller: eMailController,
                  decoration: InputDecoration(
                    hintText: 'Kişinin emaili',
                    prefixIcon: const Icon(Icons.email),
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Telefon"),
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    hintText: 'Kişinin telefonu',
                    labelText: "Telefon",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Hakkında"),
                ),
                TextField(
                  controller: detailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.description),
                    hintText: 'Kişinin detayı',
                    labelText: "Hakkında",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Meslek"),
                ),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.work),
                    hintText: 'Kişinin mesleği',
                    labelText: "Meslek",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Doğum günü"),
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  controller: birthDayController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.cake),
                    hintText: 'Kişinin doğum günü',
                    labelText: "Doğum Günü",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Web Sitesi"),
                ),
                TextField(
                  controller: webSiteController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.public),
                    hintText: 'Kişinin web sitesi',
                    labelText: "Web Sitesi",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow,
                Padding(
                  padding: context.paddingLow,
                  child: const Text("Konum"),
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    hintText: 'Kişinin konumu',
                    labelText: "Konum",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.onBackground),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: context.lowBorderRadius,
                      borderSide:
                          BorderSide(color: context.colorScheme.surface),
                    ),
                  ),
                  cursorColor: context.colorScheme.onSecondary,
                ),
                context.emptySizedHeightBoxLow3x,
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text(
                        "Resim Yükle",
                        style: TextStyle(color: context.colorScheme.onSurface),
                      ),
                    ),
                  ),
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
                            data: "Vazgeç",
                            color: context.colorScheme.onSurface),
                        style: ElevatedButton.styleFrom(
                            primary: context.colorScheme.secondaryVariant),
                      ),
                      context.emptySizedWidthBoxLow,
                      ElevatedButton(
                        onPressed: () async {
                          // String baseImageUrl =
                          //     "http://192.168.3.53/assets/images/users/";
                          Dio dio = Dio();
                          await dio.post(
                              "http://192.168.3.53/api/Persons/update_guide?token=${ApplicationConstants.instance!.token}&id=${_viewModel.items.guides?[index].id}&name=${nameController.text}&email=${eMailController.text}&tel=${phoneController.text}&detail=${detailController.text}&company_id=${_viewModel.items.guides?[index].companyId}&job=${jobController.text}&photo=$_image&birthday=${birthDayController.text}&web_site=${webSiteController.text}&location=${locationController.text}");
                          setState(() {
                            _viewModel.fetchItems(
                                ApplicationConstants.instance!.token);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    context.colorScheme.secondaryVariant,
                                duration: context.durationSlow,
                                content: BodyText2Copy(
                                  data: "Kişi başarıyla güncellendi !",
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                            );
                          });
                        },
                        child: BodyText2Copy(
                            data: "Kaydet",
                            color: context.colorScheme.onSurface),
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
      },
    );
  }

  _showDialog(BuildContext context, double radius, ContactViewModel viewModel,
      int index) {
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
                    final Dio dio = Dio();
                    dio.post(
                        "http://192.168.3.53/api/Persons/delete_guide?token=${ApplicationConstants.instance!.token}&id=${viewModel.items.guides?[index].id}");
                    viewModel.fetchItems(ApplicationConstants.instance!.token);
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

class PopUpItemBody extends StatefulWidget {
  final ContactViewModel viewModel;
  const PopUpItemBody({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<PopUpItemBody> createState() => _PopUpItemBodyState();
}

class _PopUpItemBodyState extends State<PopUpItemBody> {
  var nameController = TextEditingController();

  var eMailController = TextEditingController();

  var phoneController = TextEditingController();

  var detailController = TextEditingController();

  var jobController = TextEditingController();

  late final ContactViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(1.1),
      child: Center(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
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
              context.emptySizedHeightBoxLow,
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: "İsim",
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
              context.emptySizedHeightBoxLow,
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: eMailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: "Eposta",
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
              context.emptySizedHeightBoxLow,
              TextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'Telefon',
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
              context.emptySizedHeightBoxLow,
              Padding(
                padding: context.paddingLow,
                child: const Text("Hakkında"),
              ),
              context.emptySizedHeightBoxLow,
              TextField(
                controller: detailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description),
                  labelText: 'Hakkında',
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
              context.emptySizedHeightBoxLow,
              Padding(
                padding: context.paddingLow,
                child: const Text("Meslek"),
              ),
              context.emptySizedHeightBoxLow,
              TextField(
                controller: jobController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.work),
                  labelText: 'Meslek',
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
                      onPressed: () async {
                        Dio dio = Dio();
                        await dio.post(
                            "http://192.168.3.53/api/Persons/new_guide?token=${ApplicationConstants.instance!.token}&name=${nameController.text}&email=${eMailController.text}&tel=${eMailController.text}&detail=${detailController.text}&company_id=${eMailController.text}&job=${jobController.text}");

                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                context.colorScheme.secondaryVariant,
                            duration: context.durationSlow,
                            content: BodyText2Copy(
                              data: "Kişi başarıyla eklendi !",
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        );
                        setState(() {
                          viewModel
                              .fetchItems(ApplicationConstants.instance!.token);
                        });
                      },
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
      ),
    );
  }
}
