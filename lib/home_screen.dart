import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ➕ ADD
import 'package:webyab/app_widget.dart';
import 'package:webyab/banner_repository.dart';
import 'package:webyab/banner_slider.dart';
import 'package:webyab/bloc/banner_bloc.dart';
import 'package:webyab/home_header.dart';
import 'package:webyab/search_bar_widget.dart';

import 'package:dio/dio.dart'; // ➕ ADD

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ➕ ADD THIS ONLY
      create: (_) => BannerBloc(BannerRepository(Dio())),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(height: 5),
              SearchBarWidget(),
              BannerSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
