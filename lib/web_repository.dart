import 'package:dio/dio.dart';
import 'package:webyab/api_url.dart';
import 'package:webyab/web_model.dart';

class WebRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  Future<List<WebModel>> getWebsites() async {
    try {
      final response = await _dio.get(ApiUrl.webEndpoint);

      if (response.statusCode == 200) {
        final data = response.data;

        final List records = data["items"] ?? [];

        return records.map((e) => WebModel.fromJson(e)).toList();
      }

      throw Exception("خطا در دریافت اطلاعات");
    } on DioException catch (e) {
      throw Exception(e.message ?? "خطای شبکه");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
