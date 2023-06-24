import 'package:base_project/core/router/BaseRouterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseRouterProvider extends BlocProvider<IBaseRouter> {
  BaseRouterProvider({
    Key? key,
  }) : super(
          key: key,
          create: (context) => BaseRouter(),
          lazy: false,
        );
}

class BaseRouter extends IBaseRouter {
  final _navigationChannel = const MethodChannel("navigation.base-channel");

  BaseRouter()
      : super(
          IBaseRouterState.initial(),
        ) {
    _prepareRouterChannel();
  }

  void _prepareRouterChannel() {
    _navigationChannel.setMethodCallHandler(
      (call) async {
        final method = call.method;
        final arguments = call.arguments;
        switch (method) {
          case 'initialRoute':
            final link = arguments as String;
            break;
          case 'pop':
            {
              final isValidPop = super.isValidPop();
              if (isValidPop) {
                super.pop();
              }
              else {
                _navigationChannel.invokeMethod("pop","");
              }
            }
          default:
            break;
        }
      },
    );
  }
}
