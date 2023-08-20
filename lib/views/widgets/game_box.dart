import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/blocs/game_box_bloc.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_sizes.dart';
import '../../helper/extension/show_dialog.dart';
import 'game_button.dart';

class GameBox extends StatelessWidget {
  final double height;
  final double width;
  final int currentUser;

  const GameBox({
    super.key,
    required this.height,
    required this.width,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    double heightCurrent = MediaQuery.sizeOf(context).height;
    double widthCurrent = MediaQuery.sizeOf(context).width;
    return BlocListener<GameBoxBloc, GameBoxState>(
      listener: (context, state) {
        if (state.status == GameBoxStatus.completed) {
          state.alert.playerWonDialog(
            context: context,
            width: width,
            height: height,
            function: () => context.read<GameBoxBloc>().add(ResetGameEvent()),
          );
        }
      },
      child: BlocBuilder<GameBoxBloc, GameBoxState>(
        builder: (context, state) {
          return Container(
            height: height * AppSizes.kGameBoxHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.primary.withOpacity(AppSizes.kBoxBGOpacity),
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: AppSizes.kBorderWidth),
                borderRadius: BorderRadius.circular(AppDimensions.kGameBoxRadius)),
            child: GridView.builder(
              padding:  const EdgeInsets.all(10),
              itemCount: AppSizes.kBoxCount,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppSizes.kCrossAxisCount,
                crossAxisSpacing: widthCurrent * AppSizes.kCrossAxisSpacing,
                mainAxisSpacing:heightCurrent *  AppSizes.kMainAxisSpacing,
                mainAxisExtent: height* AppSizes.kBoxHeight,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<GameBoxBloc>().add(SelectBoxEvent(
                          index: index,
                          context: context,
                          currentUser: currentUser,
                        ));
                  },
                  child: GameButton(
                    indexesList: state.selectedIndex,
                    currentIndex: index,
                    buttonText: state.filledBox[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
