import 'package:appointment/core/di/dependency_injection.dart';
import 'package:appointment/core/helpers/constants.dart';
import 'package:appointment/core/helpers/extensions.dart';
import 'package:appointment/core/helpers/shared_pref_helper.dart';
import 'package:appointment/core/routing/app_router.dart';
import 'package:appointment/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetTt();
  await ScreenUtil.ensureScreenSize();
  await checkIfUserIsLoggedIn();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfUserIsLoggedIn() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
