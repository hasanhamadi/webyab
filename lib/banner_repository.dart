import 'package:dio/dio.dart';
import 'api_url.dart';
import 'banner_model.dart';

class BannerRepository {
  final Dio _dio;

  BannerRepository(this._dio);

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final response = await _dio.get("${ApiUrl.baseUrl}${ApiUrl.banners}");

      final data = response.data;

      if (data == null || data['items'] == null) {
        return [];
      }

      final List items = data['items'];

      return items.map((e) => BannerModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load banners: $e");
    }
  }
}
