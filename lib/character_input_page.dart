import 'package:flutter/material.dart';
import 'package:flutter_gakkai_07/character_result_page.dart';
import 'package:flutter_gakkai_07/usecase/generate_%20character_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterInputPage extends ConsumerStatefulWidget {
  const CharacterInputPage({super.key});

  @override
  ConsumerState<CharacterInputPage> createState() => _CharacterInputPageState();
}

class _CharacterInputPageState extends ConsumerState<CharacterInputPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'cat');
  final _personalityController = TextEditingController(text: '猫の見た目');
  final _storyController = TextEditingController(text: '道で拾われた');
  double _age = 25;
  String _gender = '未選択';

  @override
  void dispose() {
    _nameController.dispose();
    _personalityController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIキャラクタージェネレーター'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'キャラクター名',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '名前を入力してください';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text('年齢: ${_age.round()}歳'),
                Slider(
                  value: _age,
                  min: 1,
                  max: 100,
                  divisions: 99,
                  label: _age.round().toString(),
                  onChanged: (value) => setState(() => _age = value),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: const InputDecoration(
                    labelText: '性別',
                    border: OutlineInputBorder(),
                  ),
                  items: ['男性', '女性', '未選択']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => _gender = value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _personalityController,
                  decoration: const InputDecoration(
                    labelText: '性格特性',
                    hintText: '例：勇敢、好奇心旺盛、知的',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '性格特性を入力してください';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _storyController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'バックストーリー',
                    hintText: '例：孤児として育ち、魔法学校で才能を開花させた。今は正義のために戦う冒険者として活動中。',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'バックストーリーを提供してください';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final generatedCharacter =
                          await ref.read(generateImageUsecaseProvider).invoke(
                                characterName: _nameController.text,
                                age: _age.round(),
                                gender: _gender,
                                personality: _personalityController.text,
                                story: _storyController.text,
                              );
                      if (!mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterResultPage(
                            description: generatedCharacter.description,
                            image: generatedCharacter.image,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('キャラクターを生成'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
