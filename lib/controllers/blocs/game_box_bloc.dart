import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../cubit/change_user.dart';
import '../../helper/constants/app_strings.dart';

part 'game_box_events.dart';

part 'game_box_states.dart';

class GameBoxBloc extends Bloc<GameBoxEvents, GameBoxState> {
  GameBoxBloc() : super(const GameBoxState()) {
    on<SelectBoxEvent>(onSelectBoxEvent);
    on<ResetGameEvent>(onResetGameEvent);
  }

  onSelectBoxEvent(SelectBoxEvent event, Emitter<GameBoxState> emit) {
    List<int> indexList = List.from(state.selectedIndex);
    List<String> filledIndex = List.from(state.filledBox);
    if (!indexList.contains(event.index)) {
      indexList.add(event.index);
      if (event.currentUser == 1) {
        filledIndex[event.index] = AppString.kPlayerOneSymbol;
      } else {
        filledIndex[event.index] = AppString.kPlayerTwoSymbol;
      }
      event.context.read<ChangeUserCubit>().switchUser();
      if (filledIndex[0] == AppString.kPlayerOneSymbol &&
              filledIndex[1] == AppString.kPlayerOneSymbol &&
              filledIndex[2] == AppString.kPlayerOneSymbol ||
          filledIndex[3] == AppString.kPlayerOneSymbol &&
              filledIndex[4] == AppString.kPlayerOneSymbol &&
              filledIndex[5] == AppString.kPlayerOneSymbol ||
          filledIndex[6] == AppString.kPlayerOneSymbol &&
              filledIndex[7] == AppString.kPlayerOneSymbol &&
              filledIndex[8] == AppString.kPlayerOneSymbol ||
          filledIndex[0] == AppString.kPlayerOneSymbol &&
              filledIndex[4] == AppString.kPlayerOneSymbol &&
              filledIndex[8] == AppString.kPlayerOneSymbol ||
          filledIndex[2] == AppString.kPlayerOneSymbol &&
              filledIndex[4] == AppString.kPlayerOneSymbol &&
              filledIndex[6] == AppString.kPlayerOneSymbol ||
          filledIndex[0] == AppString.kPlayerOneSymbol &&
              filledIndex[3] == AppString.kPlayerOneSymbol &&
              filledIndex[6] == AppString.kPlayerOneSymbol ||
          filledIndex[1] == AppString.kPlayerOneSymbol &&
              filledIndex[4] == AppString.kPlayerOneSymbol &&
              filledIndex[7] == AppString.kPlayerOneSymbol ||
          filledIndex[2] == AppString.kPlayerOneSymbol &&
              filledIndex[5] == AppString.kPlayerOneSymbol &&
              filledIndex[8] == AppString.kPlayerOneSymbol) {
        emit(state.copyWith(
          status: GameBoxStatus.completed,
          alert: AppString.kPlayerOneWonAlert,
          selectedIndex: [],
          filledBox: [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
          ],
        ));
      } else if (filledIndex[0] == AppString.kPlayerTwoSymbol &&
              filledIndex[1] == AppString.kPlayerTwoSymbol &&
              filledIndex[2] == AppString.kPlayerTwoSymbol ||
          filledIndex[3] == AppString.kPlayerTwoSymbol &&
              filledIndex[4] == AppString.kPlayerTwoSymbol &&
              filledIndex[5] == AppString.kPlayerTwoSymbol ||
          filledIndex[6] == AppString.kPlayerTwoSymbol &&
              filledIndex[7] == AppString.kPlayerTwoSymbol &&
              filledIndex[8] == AppString.kPlayerTwoSymbol ||
          filledIndex[0] == AppString.kPlayerTwoSymbol &&
              filledIndex[4] == AppString.kPlayerTwoSymbol &&
              filledIndex[8] == AppString.kPlayerTwoSymbol ||
          filledIndex[2] == AppString.kPlayerTwoSymbol &&
              filledIndex[4] == AppString.kPlayerTwoSymbol &&
              filledIndex[6] == AppString.kPlayerTwoSymbol ||
          filledIndex[0] == AppString.kPlayerTwoSymbol &&
              filledIndex[3] == AppString.kPlayerTwoSymbol &&
              filledIndex[6] == AppString.kPlayerTwoSymbol ||
          filledIndex[1] == AppString.kPlayerTwoSymbol &&
              filledIndex[4] == AppString.kPlayerTwoSymbol &&
              filledIndex[7] == AppString.kPlayerTwoSymbol ||
          filledIndex[2] == AppString.kPlayerTwoSymbol &&
              filledIndex[5] == AppString.kPlayerTwoSymbol &&
              filledIndex[8] == AppString.kPlayerTwoSymbol) {
        emit(state.copyWith(
          status: GameBoxStatus.completed,
          alert: AppString.kPlayerTwoWonAlert,
          selectedIndex: [],
          filledBox: [
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
          ],
        ));
      } else {
        emit(state.copyWith(
          status: GameBoxStatus.added,
          selectedIndex: indexList,
          filledBox: filledIndex,
        ));
      }
    }
  }

  onResetGameEvent(ResetGameEvent event, Emitter<GameBoxState> emit) {
    emit(state.copyWith(
      alert: '',
      selectedIndex: [],
      status: GameBoxStatus.initial,
      filledBox: [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ],
    ));
  }
}
