import 'dart:math';

import 'package:base_project/core/router/BaseRouterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash View1"),

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){

            context.read<IBaseRouter>().push(link: "link");
          },
          child: const Text("asdasdas"),
        ),
      ),
    );
  }
}


class SplashPage2View extends StatelessWidget {
   SplashPage2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash View  2"),
        leading: IconButton(
          icon : const Icon(Icons.arrow_back),
          onPressed: (){
            context.read<IBaseRouter>().pop();
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){

            context.read<IBaseRouter>().push(link: "link");
          },
          child: Text(getRandomString(5)),
        ),
      ),
    );
  }
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}