import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_books/Controllers/homeController.dart';
import 'package:trading_books/Controllers/profilController.dart';
import 'package:trading_books/Core/Constants/AppRoutes.dart';
import 'package:trading_books/Views/screens/editProfil.dart';
import 'package:trading_books/Views/screens/payment.dart';

class Profile extends GetView<HomeController> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            BigUserCard(
              backgroundColor: Colors.red,
              userName: "Omar Baizou",
              userProfilePic: const AssetImage("assets/images/shape2.png"),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Modify",
                subtitle: "Tap to change your data",
                onTap: () {
                  Get.to(const EditProfile());
                  print("OK");
                },
              ),
            ),
            GetBuilder<ProfilController>(
              builder: (controller2) => SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      controller.changePage(5);
                    },
                    icons: Icons.payment,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Payment',
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.monetization_on,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'My orders',
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.person_add_alt,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Followers',
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.person_2_outlined,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Following',
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.fingerprint,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Privacy',
                  ),
                  SettingsItem(
                    onTap: () {
                      controller2.theme = true;
                    },
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Dark mode',
                    subtitle: "Automatic",
                    trailing: Switch.adaptive(
                      value: controller2.theme,
                      onChanged: (value) {
                        controller2.theme = value;
                        controller.update();
                      },
                    ),
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'About',
                  ),
                ],
              ),
            ),
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.repeat,
                  title: "Change email",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
