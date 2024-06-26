import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/app_route.dart';
import '/core/my_bloc_observer.dart';
import '/features/todo/presentation/bloc/bloc/todo_bloc.dart';
import '/features/todo/presentation/pages/done_todo_page.dart';
import '/features/todo/presentation/pages/splash_screen.dart';
import '/features/todo/presentation/pages/todo_page.dart';
import '/core/services/my_services.dart' as id;
import '/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
  id.init();
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        AppRoute.todo: (context) => BlocProvider(
              create: (context) => id.ls.get<TodoBloc>()..add(GetNotDoneTodoEvent()),
              child: const TodoPage(),
            ),
        AppRoute.done: (context) => BlocProvider(
              create: (context) => id.ls.get<TodoBloc>()..add(GetDoneTodoEvent()),
              child: const DoneTodoPage(),
            )
      },
      theme: myTheme(),
    );
  }
}
