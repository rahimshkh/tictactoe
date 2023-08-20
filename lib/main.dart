import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/cubit/change_user.dart';
import 'helper/theme/app_theme.dart';

import 'controllers/blocs/game_box_bloc.dart';
import 'views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeUserCubit()),
        BlocProvider(create: (context) => GameBoxBloc()),
      ],
      child: MaterialApp(
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
