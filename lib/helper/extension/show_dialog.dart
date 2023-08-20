import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';

extension AlertUtils on String {
  playerWonDialog({
    required BuildContext context,
    required double width,
    required double height,
    required Function function,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
                height: height* AppSizes.kAlertDialogHeight,
                child: Column(
            children: [
                Text(this),
                SizedBox(
                  height: height * AppSizes.kDialogSpaceBetween,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    function();
                  },
                  child: const Text(AppString.kResetButton),
                )
            ],
          ),
              ));
        });
  }
}
