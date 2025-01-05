import 'package:freezed_annotation/freezed_annotation.dart';

part 'genkit_response.freezed.dart';

/// Genkit `generateCharacterFlow` エンドポイントのレスポンスを格納するための DTO
@freezed
class GenkitResponse with _$GenkitResponse {
  const factory GenkitResponse({
    required String description,
    required String image,
  }) = _GenkitResponse;

  factory GenkitResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'] as Map<String, dynamic>;
    return GenkitResponse(
      description: result['description'] as String,
      image: result['image'] as String,
    );
  }
}
