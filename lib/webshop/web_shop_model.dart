class WebShopModel {
  final String id;
  final String collectionId;
  final String icon;
  final String name;
  final String domain;
  final String url;

  const WebShopModel({
    required this.id,
    required this.collectionId,
    required this.icon,
    required this.name,
    required this.domain,
    required this.url,
  });

  factory WebShopModel.fromJson(Map<String, dynamic> json) {
    return WebShopModel(
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

  String get imageUrl =>
      "https://webyab.chbkn.run/api/files/$collectionId/$id/$icon";
}
