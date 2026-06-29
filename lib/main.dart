import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:webyab/banner/banner_repository.dart';
import 'package:webyab/banner/bloc/banner_bloc.dart';

import 'package:webyab/web/web_repository.dart';
import 'package:webyab/web/bloc/web_bloc.dart';

import 'package:webyab/webshop/web_shop_repository.dart';
import 'package:webyab/webshop/bloc/webshop_bloc.dart';

import 'package:webyab/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Banner
        BlocProvider(create: (_) => BannerBloc(BannerRepository(Dio()))),

        /// Web
        BlocProvider(create: (_) => WebBloc(WebRepository())),

        /// Web Shop
        BlocProvider(create: (_) => WebShopBloc(WebShopRepository())),
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
        home: const HomeScreen(),
      ),
    );
  }
}
