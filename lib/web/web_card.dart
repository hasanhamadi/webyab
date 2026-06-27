import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webyab/web_model.dart';

class WebCard extends StatelessWidget {
  final WebModel web;

  const WebCard({super.key, required this.web});

  Future<void> _launchWebsite(BuildContext context) async {
    if (web.url.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("لینک سایت موجود نیست")));
      return;
    }

    final Uri uri = Uri.parse(web.url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("امکان باز کردن سایت وجود ندارد")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: web.icon.isEmpty
                        ? Container(
                            width: 70,
                            height: 70,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.language, size: 36),
                          )
                        : Image.network(
                            web.imageUrl,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                width: 70,
                                height: 70,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.language, size: 36),
                              );
                            },
                          ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    web.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    web.domain,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF453EFA),
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _launchWebsite(context),
                      child: const Text(
                        "مشاهده سایت",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFF453EFA),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "ویژه",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
