import 'package:flutter/material.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_sizes.dart';

class GameButton extends StatelessWidget {
  final List<int> indexesList;
  final int currentIndex;
  final String buttonText;

  const GameButton({
    super.key,
    required this.currentIndex,
    required this.indexesList,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(AppDimensions.kGameBoxRadius)),
      child: Text(
        buttonText,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: AppSizes.kGameBoxChildSize),
      ),
    );
  }
}
