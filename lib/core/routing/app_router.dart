import 'package:appointment/core/di/dependency_injection.dart';
import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/features/home/home_screen.dart';
import 'package:appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment/features/on_boarding/on_boarding_screen.dart';
import 'package:appointment/features/login/ui/login_screen.dart';
import 'package:appointment/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:appointment/features/sign_up/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
// this arguments to be passed to any screen like this ( arguments as ClassName )
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
