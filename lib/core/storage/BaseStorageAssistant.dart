import 'package:base_project/core/storage/IBase_storage_assistant.dart';

class BaseStorageAssistant extends IBaseStorageAssistant {

  // todo add storage provider based on use case

  @override
  Future<void> delete<T>({
    required T value,
  }) {
    // todo implement function based on requirements and package
    throw UnimplementedError();
  }

  @override
  Future<T?> get<T>({
    // todo implement function based on requirements and package
    required String key,
  }) {
    throw UnimplementedError();
  }

  @override
  void prepare() {}

  @override
  Future<void> set<T>({
    required String key,
    required T value,
  }) {
    // todo implement function based on requirements and package
    throw UnimplementedError();
  }

  @override
  Future<void> update<T>({
    required String key,
    required T value,
  }) {
    // todo implement function based on requirements and package
    throw UnimplementedError();
  }
}
