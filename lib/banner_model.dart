class BannerModel {
  final String id;
  final String image;
  final String icon;
  final String name;
  final String link;
  final String web;

  BannerModel({
    required this.id,
    required this.image,
    required this.icon,
    required this.name,
    required this.link,
    required this.web,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    final collectionId = json['collectionId']?.toString() ?? '';
    final recordId = json['id']?.toString() ?? '';

    return BannerModel(
      id: recordId,
      image:
          "https://webyab.chbkn.run/api/files/$collectionId/$recordId/${json['image']}",
      icon:
          "https://webyab.chbkn.run/api/files/$collectionId/$recordId/${json['icon']}",
      name: json['name']?.toString() ?? '',
      link: json['link']?.toString() ?? '',
      web: json['web']?.toString() ?? '',
    );
  }
}
