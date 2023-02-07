import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themovie/core/core.dart';
import 'package:themovie/core/router/app_router.dart';

class TheMovieApp extends HookConsumerWidget {
  const TheMovieApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'The Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: goRouter,
    );
  }
}
