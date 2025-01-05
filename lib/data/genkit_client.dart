import 'package:dio/dio.dart';
import 'package:flutter_gakkai_07/data/genkit_response.dart';

class GenkitClient {
  GenkitClient({
    required this.dio,
    required this.genkitEndpoint,
  });
  final Dio dio;
  final String genkitEndpoint;

  Future<GenkitResponse> runGenkit({
    required String idToken,
    required String characterName,
    required int age,
    required String gender,
    required String personality,
    required String story,
  }) async {
    try {
      final response = await dio.post(
        'https://$genkitEndpoint.run.app',
        options: Options(
          headers: {
            'Authorization': 'Bearer $idToken',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'data': {
            'characterName': characterName,
            'age': age,
            'gender': gender,
            'personality': personality,
            'story': story,
          },
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to generate image: ${response.statusCode}');
      }

      return GenkitResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to generate image: ${e.message}');
    }
  }
}
