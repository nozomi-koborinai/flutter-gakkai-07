class AppException implements Exception {
  final String message;
  const AppException([this.message = 'エラーが発生しました']);

  @override
  String toString() {
    return message;
  }
}
