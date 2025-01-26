import 'package:flutter_gakkai_07/data/genkit/genkit_response.dart';
import 'package:flutter_gakkai_07/providers.dart';
import 'package:flutter_gakkai_07/ui/components/overlay_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final generateImageUsecaseProvider = Provider<GenerateImageUsecase>(
  GenerateImageUsecase.new,
);

class GenerateImageUsecase {
  final Ref ref;

  GenerateImageUsecase(this.ref);

  Future<GenkitResponse> invoke({
    required String characterName,
    required int age,
    required String gender,
    required String personality,
    required String story,
  }) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      final idToken = await ref.read(authProvider).currentUser?.getIdToken();
      return await ref.read(genkitClientProvider).runGenkit(
            idToken: idToken ?? '',
            characterName: characterName,
            age: age,
            gender: gender,
            personality: personality,
            story: story,
          );
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
