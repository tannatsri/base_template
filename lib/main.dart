import 'package:base_project/core/router/BaseRouter.dart';
import 'package:base_project/core/router/BaseRouterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BaseRouterProvider(),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<IBaseRouter, IBaseRouterState>(
            builder: (context, state) {
          return Navigator(
            pages: state.pages,
            onPopPage: (route, result) {
              final isRoutePopped = route.didPop(result);
              if (isRoutePopped) {
                context.read<IBaseRouter>().pop();
              }
              return isRoutePopped;
            },
          );
        }),
      ),
    );
  }
}
