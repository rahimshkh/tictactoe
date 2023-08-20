import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/cubit/change_user.dart';
import '../../helper/constants/app_dimensions.dart';
import '../../helper/constants/app_sizes.dart';
import '../../helper/constants/app_strings.dart';
import '../widgets/game_box.dart';
import '../widgets/player_label.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ChangeUserCubit, bool>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(
              vertical: height * AppDimensions.kMainScreenPaddingVertical,
              horizontal: width * AppDimensions.kMainScreenPaddingHorizontal,
            ),
            children: [
              PlayerLabel(
                mainAxisAlignment: MainAxisAlignment.start,
                width: width,
                height: height,
                playerName: AppString.kPlayerOne,
                isActive: state,
              ),
              SizedBox(height: height * AppSizes.kMainSpaceBetween),
              GameBox(
                height: height,
                width: width,
                currentUser: state ? 1 : 2,
              ),
              SizedBox(height: height * AppSizes.kMainSpaceBetween),
              PlayerLabel(
                mainAxisAlignment: MainAxisAlignment.end,
                width: width,
                height: height,
                playerName: AppString.kPlayerTwo,
                isActive: !state,
              ),
            ],
          );
        },
      ),
    );
  }
}
