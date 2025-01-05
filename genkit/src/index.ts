import { genkit } from 'genkit'
import googleAI from '@genkit-ai/googleai'
import vertexAI from '@genkit-ai/vertexai'
import { defineSecret } from 'firebase-functions/params'
import { enableGoogleCloudTelemetry } from '@genkit-ai/google-cloud'
import { logger } from 'genkit/logging'
import { onFlow } from '@genkit-ai/firebase/functions'
import { z } from 'genkit'
import { firebaseAuth } from '@genkit-ai/firebase/auth'

// ログレベルを degub に設定
logger.setLogLevel(`debug`)

// Genkit AI モニタリングの機能を使うためにテレメトリを有効化
enableGoogleCloudTelemetry()

// Google Cloud 上の Secret Manager に保存されている Google AI の API キーを取得
export const googleAIapiKey = defineSecret(`GOOGLE_GENAI_API_KEY`)

// Google AI と Vertex AI プラグインを使用して Genkit を初期化
export const ai = genkit({
  plugins: [googleAI(), vertexAI()],
})

const characterTranslationEnPrompt = ai.prompt<z.ZodTypeAny, z.ZodTypeAny>(`characterTranslationEn`)
const characterDescriptionGeneratorPrompt = ai.prompt<z.ZodTypeAny, z.ZodTypeAny>(`characterDescriptionGenerator`)
const characterImageGeneratorPrompt = ai.prompt<z.ZodTypeAny, z.ZodTypeAny>(`characterImageGenerator`)

export const generateCharacterFlow = onFlow(
  ai,
  {
    name: `generateCharacterFlow`,
    // リクエストデータの型定義
    inputSchema: z.object({
      characterName: z.string(),
      age: z.number(),
      gender: z.string(),
      personality: z.string(),
      story: z.string(),
    }),
    // レスポンスデータの型定義
    outputSchema: z.object({
      description: z.string(),
      image: z.string(),
    }),
    // 認証ポリシー -> 匿名ユーザーのみアクセス可能
    authPolicy: firebaseAuth((user) => {
      if (user.firebase?.sign_in_provider !== `anonymous`) {
        throw new Error(`Only anonymously authenticated users can access this function`)
      }
    }),
    httpsOptions: {
      secrets: [googleAIapiKey],
      cors: true,
      region: `asia-northeast1`,
    },
  },
  // メインの処理フロー
  async (input) => {
    // 1. クライアントのリクエスト情報からキャラクターの説明文を日本語で生成
    const { output: characterDescription } = await characterDescriptionGeneratorPrompt(input)

    // 2. キャラクター情報を英語に翻訳（画像生成モデルの Imagen3 が日本語に対応していないため）
    const { output: translatedCharacter } = await characterTranslationEnPrompt(input)

    // 3. 翻訳された情報をもとに画像を生成
    const { media } = await characterImageGeneratorPrompt(translatedCharacter)

    // 4. 生成された説明文と画像 (Base64) を返却
    return {
      description: characterDescription.description,
      image: media?.url || ``,
    }
  }
)
