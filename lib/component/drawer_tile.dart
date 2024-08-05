import 'package:flutter/material.dart';

import 'custom_text.dart';

class DrawerTile extends StatelessWidget {
  final String drawerTitle;
  final IconData drawerIcon;
  final void Function()? onTap;
  const DrawerTile({
    super.key,
    required this.drawerIcon,
    required this.drawerTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        drawerIcon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: CustomText(
          text: drawerTitle,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onPrimary),
      onTap: onTap,
    );
  }
}
