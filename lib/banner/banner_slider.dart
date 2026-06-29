import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'bloc/banner_bloc.dart';
import 'banner_card.dart';
import 'banner_indicator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  // کنترلر صفحه برای اسلایدر
  final int _initialPage = 10000;

  late final PageController _pageController = PageController(
    initialPage: _initialPage,
    viewportFraction: 0.95,
  );

  late int _currentPage = _initialPage;

  // تایمر برای اسلاید خودکار
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // گرفتن لیست بنرها از Bloc
    context.read<BannerBloc>().add(const FetchBanners());

    // اسلاید خودکار هر 3 ثانیه
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (!mounted) return;

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // باز کردن لینک سایت
  Future<void> _openWebsite(String url) async {
    try {
      String website = url.trim();

      final markdown = RegExp(r'\((https?:\/\/.*?)\)');
      final match = markdown.firstMatch(website);

      if (match != null) {
        website = match.group(1)!;
      }

      if (!website.startsWith('http://') && !website.startsWith('https://')) {
        website = 'https://$website';
      }

      final uri = Uri.parse(website);

      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('باز کردن لینک انجام نشد')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const SizedBox(
            height: 350,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is BannerError) {
          return SizedBox(
            height: 350,
            child: Center(child: Text(state.message)),
          );
        }

        if (state is BannerEmpty) {
          return const SizedBox(
            height: 350,
            child: Center(child: Text("هیچ بنری برای نمایش وجود ندارد")),
          );
        }

        if (state is BannerLoaded) {
          return Column(
            children: [
              SizedBox(
                height: 345,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: null,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = state.banners[index % state.banners.length];

                    return BannerCard(
                      banner: banner,
                      onTap: () => _openWebsite(banner.web),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),

              BannerIndicator(
                activeIndex: _currentPage % state.banners.length,
                count: state.banners.length,
              ),

              const SizedBox(height: 10),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
