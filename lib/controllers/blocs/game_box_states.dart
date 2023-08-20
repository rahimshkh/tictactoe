part of 'game_box_bloc.dart';

enum GameBoxStatus { initial, added, completed }

class GameBoxState extends Equatable {
  final GameBoxStatus status;
  final List<int> selectedIndex;
  final List<String> filledBox;
  final String alert;

  const GameBoxState({
    this.status = GameBoxStatus.initial,
    this.selectedIndex = const <int>[],
    this.alert = '',
    this.filledBox = const <String>[
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
  });

  GameBoxState copyWith(
      {GameBoxStatus? status,
      List<int>? selectedIndex,
      String? alert,
      List<String>? filledBox}) {
    return GameBoxState(
        status: status ?? this.status,
        selectedIndex: selectedIndex ?? List.from(this.selectedIndex),
        alert: alert ?? this.alert,
        filledBox: filledBox ?? this.filledBox);
  }

  @override
  List<Object> get props => [status, selectedIndex, alert, filledBox];

  @override
  String toString() {
    return "status is $status, list is $selectedIndex, alert is $alert";
  }
}
