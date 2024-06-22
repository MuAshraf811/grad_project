import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/dummy.dart';
import '../../../generated/l10n.dart';
import 'widgets/theme_switch.dart';
import 'widgets/upper_profile_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const _titlesIcon = [
    Icons.account_box,
    Icons.notifications,
    Icons.money,
    Icons.help_center,
    Icons.star,
    Icons.logout
  ];
  static const _iconsColor = [
    Colors.grey,
    Colors.redAccent,
    Colors.green,
    Color.fromARGB(255, 6, 113, 201),
    Color.fromARGB(255, 238, 220, 56),
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    final listTileTitles = [
      S.of(context).account,
      S.of(context).notifications,
      S.of(context).payment,
      S.of(context).support,
      S.of(context).rate,
      S.of(context).logOut
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 28),
            const UpperProfileWidget(),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 30,
                child: ThemeSwitch(),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.blue,
              ),
              title: Text(S.of(context).lang),
              trailing: const LangSwitch(),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: ConstantColors.appMainColor,
                    onTap: () {
                      switch (index) {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        default:
                      }
                    },
                    child: ListTile(
                      leading: Icon(
                        _titlesIcon[index],
                        color: _iconsColor[index],
                      ),
                      title: Text(
                        listTileTitles[index],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                itemCount: listTileTitles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
