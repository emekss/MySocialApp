import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social/component/custom_text.dart';
import 'package:social/component/settings_tile.dart';
import 'package:social/themes/theme_provider.dart';

/*
SETTINGS PAGE

- Dark Mode
- Blocked users
-Account settings





*/

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: CustomText(
            text: 'S E T T I N G S',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimary),
      ),
      body: Column(
        children: [
          SettingsTile(
            title: 'Dark Mode',
            trailing: CupertinoSwitch(
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
          ),
          const SettingsTile(
            title: 'Account Settings',
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          )
        ],
      ),
    );
  }
}
