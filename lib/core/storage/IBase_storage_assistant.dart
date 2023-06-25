abstract class IBaseStorageAssistant {


  void prepare();

  Future<T?> get<T>({
    required String key,
  });

  Future<void> set<T>({
    required String key,
    required T value,
  });

  Future<void> update<T>({
    required String key,
    required T value,
  });

  Future<void> delete<T>({
    required T value,
  });
}
