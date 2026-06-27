class WebModel {
  final String id;
  final String collectionId;
  final String icon;
  final String name;
  final String domain;
  final String url;

  const WebModel({
    required this.id,
    required this.collectionId,
    required this.icon,
    required this.name,
    required this.domain,
    required this.url,
  });

  factory WebModel.fromJson(Map<String, dynamic> json) {
    return WebModel(
      id: json["id"] ?? "",
      collectionId: json["collectionId"] ?? "",
      icon: json["icon"] ?? "",
      name: json["name"] ?? "",
      domain: json["domain"] ?? "",
      url: json["url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "collectionId": collectionId,
      "icon": icon,
      "name": name,
      "domain": domain,
      "url": url,
    };
  }

  /// لینک کامل تصویر
  String get imageUrl =>
      "https://webyab.chbkn.run/api/files/$collectionId/$id/$icon";
}
