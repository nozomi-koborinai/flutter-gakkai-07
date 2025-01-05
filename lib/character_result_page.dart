import 'package:flutter/material.dart';

class CharacterResultPage extends StatelessWidget {
  const CharacterResultPage({
    super.key,
    required this.description,
    required this.image,
  });

  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('生成されたキャラクター'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      Uri.parse(image).data!.contentAsBytes(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'AI生成された説明:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(description),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.share),
                    label: const Text('SNSで共有'),
                    onPressed: () {
                      // TODO: SNS共有機能を実装
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.cloud_upload),
                    label: const Text('ストレージに保存'),
                    onPressed: () {
                      // TODO: ストレージアップロード機能を実装
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
