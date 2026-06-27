import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:webyab/banner_repository.dart';
import 'package:webyab/bloc/banner_bloc.dart';
import 'package:webyab/home_screen.dart';

/// Banner
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

/// Web

import 'package:webyab/web/bloc/web_bloc.dart';
import 'package:webyab/web_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Banner Bloc
        BlocProvider(create: (_) => BannerBloc(BannerRepository(Dio()))),

        /// Web Bloc
        BlocProvider(create: (_) => WebBloc(WebRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        supportedLocales: const [Locale('fa')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: HomeScreen(),
      ),
    );
  }
}
