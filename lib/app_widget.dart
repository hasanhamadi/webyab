import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF212121), // رنگ پس‌زمینه تیره
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // بخش بنر
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'YOUR_IMAGE_URL', // لینک تصویر بنر خود را اینجا قرار دهید
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // بخش پایین (اطلاعات)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // آیکون بازی
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage('YOUR_ICON_URL'),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // متن‌ها
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "هشت‌خان: بازی کارتی ایرانی",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "فرمانده نبرد بزرگ باش",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                // دکمه نصب
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text("نصب"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
