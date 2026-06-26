import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerIndicator extends StatelessWidget {
  final int activeIndex;
  final int count;

  const BannerIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // دات‌ها
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: count,
                effect: const WormEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  spacing: 8,
                  activeDotColor: Color(0xFF453EFA),
                  dotColor: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // عنوان + آیکون + مشاهده همه
            Row(
              children: [
                // سمت راست: آیکون + متن
                Row(
                  children: const [
                    Icon(
                      Icons.verified, // یا Icons.local_offer یا Icons.turned_in
                      size: 18,
                      color: Color(0xFF453EFA),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'سایت‌های آگهی شده',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF0D1B2A),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // سمت چپ: مشاهده همه
                GestureDetector(
                  onTap: () {
                    // TODO: action
                  },
                  child: const Text(
                    'مشاهده همه',
                    style: TextStyle(
                      color: Color(0xFF453EFA),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
