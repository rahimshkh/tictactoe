import 'package:flutter/material.dart';
import '../../helper/constants/app_sizes.dart';

class PlayerLabel extends StatelessWidget {
  final double width;
  final double height;
  final String playerName;
  final bool isActive;
  final MainAxisAlignment mainAxisAlignment;

  const PlayerLabel(
      {super.key,
      required this.mainAxisAlignment,
      required this.width,
      required this.height,
      this.isActive = false,
      required this.playerName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CircleAvatar(
          radius: AppSizes.kPlayerDotRadius,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: isActive
              ? Icon(
                  Icons.circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: AppSizes.kPlayerDotActive,
                )
              : const SizedBox(),
        ),
        SizedBox(
          width: width * AppSizes.kLabelSpaceBetween,
        ),
        Text(
          playerName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: AppSizes.kPlayerFontSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
