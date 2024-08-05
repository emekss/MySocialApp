import 'package:flutter/material.dart';

/*

CICRLE INDICATOR

*/

// show loading circle
void showLoadingCirlce(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      elevation: 0,
      content: CircularProgressIndicator(),
    ),
  );
}

//hide loading circle
void hideLoadingCircle(BuildContext context) {
  Navigator.pop(context);
}
