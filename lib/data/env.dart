import 'package:freezed_annotation/freezed_annotation.dart';

part 'env.freezed.dart';

@freezed
class Env with _$Env {
  const factory Env({
    required String genkitEndpoint,
  }) = _Env;

  const Env._();
}
