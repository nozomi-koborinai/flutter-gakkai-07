import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gakkai_07/data/auth_repository.dart';
import 'package:flutter_gakkai_07/data/env.dart';
import 'package:flutter_gakkai_07/data/genkit_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final envProvider = Provider<Env>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

final dioProvider = Provider<Dio>(
  (_) => Dio(),
);

final authProvider = Provider<FirebaseAuth>(
  (_) => FirebaseAuth.instance,
);

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(authProvider).userChanges(),
);

final userIdProvider = Provider<String?>((ref) {
  ref.watch(authUserProvider);
  return ref.watch(authProvider).currentUser?.uid;
});

final isSignedInProvider = Provider<bool>(
  (ref) => ref.watch(userIdProvider) != null,
);

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>(
  (ref) => FirebaseAuthRepository(auth: ref.watch(authProvider)),
);

final initializeAuthProvider = FutureProvider<void>((ref) async {
  final auth = ref.watch(authProvider);
  if (auth.currentUser == null) {
    await ref.read(firebaseAuthRepositoryProvider).signinAnonymously();
  }
});

final genkitClientProvider = Provider<GenkitClient>(
  (ref) => GenkitClient(
    dio: ref.read(dioProvider),
    genkitEndpoint: ref.read(envProvider).genkitEndpoint,
  ),
);
