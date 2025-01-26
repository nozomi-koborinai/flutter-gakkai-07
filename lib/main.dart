import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gakkai_07/data/env.dart';
import 'package:flutter_gakkai_07/data/providers.dart';
import 'package:flutter_gakkai_07/firebase_options.dart';
import 'package:flutter_gakkai_07/ui/overlay_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'character_input_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase の初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Genkit エンドポイントが格納されている .env ファイルの読み込み
  await dotenv.load();

  runApp(
    ProviderScope(
      overrides: [
        // 環境変数を上書き
        envProvider.overrideWithValue(
          Env(
            genkitEndpoint: dotenv.get('GENKIT_ENDPOINT'),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(initializeAuthProvider);
    final isLoading = ref.watch(overlayLoadingProvider);

    return MaterialApp(
      title: 'Character Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
          surface: Colors.white,
          surfaceContainerHighest: Colors.grey[50],
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.indigo[300]!),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            if (isLoading) const OverlayLoading(),
          ],
        );
      },
      home: authState.when(
        data: (_) => const CharacterInputPage(),
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stack) => Scaffold(
          body: Center(
            child: Text('匿名認証エラー: $error'),
          ),
        ),
      ),
    );
  }
}
