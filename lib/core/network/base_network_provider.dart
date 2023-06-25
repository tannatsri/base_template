import 'package:base_project/core/network/base_network_assistant.dart';
import 'package:base_project/core/network/i_base_network_assistant.dart';
import 'package:provider/provider.dart';

class BaseNetworkProvider extends Provider<IBaseNetworkAssistant> {
  BaseNetworkProvider({
    super.key,
  }) : super(
    create: (context) => BaseNetworkAssistant(),
    lazy: false,
  );
}
