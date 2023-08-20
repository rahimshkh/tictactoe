part of 'game_box_bloc.dart';

abstract class GameBoxEvents {}

class SelectBoxEvent extends GameBoxEvents {
  final int index;
  final int currentUser;
  final BuildContext context;

  SelectBoxEvent({
    required this.index,
    required this.currentUser,
    required this.context,
  });
}

class ResetGameEvent extends GameBoxEvents {}
