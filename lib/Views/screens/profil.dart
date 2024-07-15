import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool theme = false;
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
              userProfilePic: AssetImage("assets/images/shape2.png"),
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
                  print("OK");
                },
              ),
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
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
                    setState(() {
                      theme = true;
                    });
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
                    value: theme,
                    onChanged: (value) {
                      setState(() {
                        theme = value;
                      });
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
                  titleStyle: TextStyle(
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
