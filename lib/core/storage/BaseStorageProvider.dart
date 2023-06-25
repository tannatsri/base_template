import 'package:base_project/core/storage/BaseStorageAssistant.dart';
import 'package:base_project/core/storage/IBase_storage_assistant.dart';
import 'package:provider/provider.dart';

class BaseStorageProvider extends Provider<IBaseStorageAssistant> {
  BaseStorageProvider({
    super.key,
  }) : super(
          create: (context) => BaseStorageAssistant(),
          lazy: false,
        );
}
