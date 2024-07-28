import 'package:appointment/core/networking/api_service.dart';
import 'package:appointment/core/networking/dio_factory.dart';
import 'package:appointment/features/login/data/repos/login_repo.dart';
import 'package:appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment/features/sign_up/data/repos/signup_repo.dart';
import 'package:appointment/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetTt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
