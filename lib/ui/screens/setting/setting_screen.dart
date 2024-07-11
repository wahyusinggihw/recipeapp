import 'package:flutter/material.dart';
import 'package:recipe_app/gen/assets.gen.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/widgets/setting/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 20,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
              child: IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              )),
        ],
      ),
      body: const SettingsScreenBody(),
    );
  }
}

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setHeight(50), horizontal: setWidth(50)),
      child: Column(
        children: [
          SettingItem(
            title: 'Language',
            leading: Icon(Icons.language, size: setFontSize(50)),
            trailling: Icon(
              Icons.arrow_forward_ios,
              size: setFontSize(35),
            ),
          ),
          // font
          SettingItem(
            title: 'Font Size',
            leading: Icon(Icons.font_download_outlined, size: setFontSize(50)),
            trailling: Icon(
              Icons.arrow_forward_ios,
              size: setFontSize(35),
            ),
          ),
          SettingItem(
            title: 'About',
            leading: Icon(Icons.info, size: setFontSize(50)),
            trailling: Icon(
              Icons.arrow_forward_ios,
              size: setFontSize(35),
            ),
            onClick: () => recipeAppAbout(context),
          ),
        ],
      ),
    );
  }

  Future recipeAppAbout(BuildContext context) => showDialog(
      builder: (context) => AboutDialog(
            applicationLegalese: appLegalese,
            applicationName: appName,
            applicationIcon: CircleAvatar(
              backgroundImage: AssetImage(Assets.icons.chef.path),
              backgroundColor: whiteColor,
              radius: 20,
            ),
            children: const [Text(appDesc)],
          ),
      context: context);
}
