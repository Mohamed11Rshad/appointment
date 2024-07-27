import 'package:appointment/core/di/dependency_injection.dart';
import 'package:appointment/core/routing/app_router.dart';
import 'package:appointment/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetTt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
