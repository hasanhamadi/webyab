import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //لوگو
          CircleAvatar(radius: 27),
          SizedBox(width: 10),
          //متن ها
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "وبیاب",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("اسانتر از همیشه", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Spacer(),
          //نوتفیکیشن
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add, size: 27),
          ),
        ],
      ),
    );
  }
}
