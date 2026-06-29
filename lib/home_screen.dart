import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:webyab/banner/banner_repository.dart';
import 'package:webyab/banner/banner_slider.dart';
import 'package:webyab/banner/bloc/banner_bloc.dart';
import 'package:webyab/home_header.dart';
import 'package:webyab/web/website_list_widget.dart';
import 'package:webyab/webshop/web_shop_card.dart';
import 'package:webyab/webshop/bloc/webshop_bloc.dart';
import 'package:webyab/webshop/bloc/webshop_event.dart';
import 'package:webyab/webshop/bloc/webshop_state.dart';
import 'package:webyab/webshop/web_shop_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<WebShopBloc>().add(GetWebEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BannerBloc(BannerRepository(Dio())),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(),

                const SizedBox(height: 5),

                const BannerSlider(),

                const SizedBox(height: 3),

                const SizedBox(height: 270, child: WebsiteListWidget()),

                const SizedBox(height: 20),
                const WebShopWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
