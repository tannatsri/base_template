import 'package:base_project/base_view/splash_view/splash_view.dart';
import 'package:base_project/core/router/BaseRouterEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IBaseRouter extends Bloc<IBaseRouterEvent, IBaseRouterState> {
  IBaseRouter(super.initialState) {
    on<IBaseRouterEvent>(
      (event, emit) {
        switch (event.runtimeType) {
          case PushEvent:
            {
              _pushPage(
                event: event as PushEvent,
                emit: emit,
              );
            }
            break;
          case PopEvent:
            {
              _popPage(
                event: event as PopEvent,
                emit: emit,
              );
            }
            break;
          case PopAllAndOpenHomeEvent:
            {
              _popAllAndOpenHome(
                event: event as PopAllAndOpenHomeEvent,
                emit: emit,
              );
            }
            break;
          case OpenLinkAfterHomeEvent:
            {
              _openLinkAfterHome(
                event: event as OpenLinkAfterHomeEvent,
                emit: emit,
              );
            }
            break;
        }
      },
    );
  }

  void _popPage({
    required PopEvent event,
    required Emitter<IBaseRouterState> emit,
  }) {
    final List<BasePage<dynamic>> pages = [];
    pages.addAll(
      state.pages.take(
        state.pages.length - 1,
      ),
    );
    emit(
      state.copyWith(pages),
    );
  }

  void _pushPage({
    required PushEvent event,
    required Emitter<IBaseRouterState> emit,
  }) {
    final List<BasePage<dynamic>> pages = [];
    pages.addAll(state.pages);
    pages.add(
      BasePage(
        child: SplashPage2View(),
      ),
    );
    emit(
      state.copyWith(pages),
    );
  }

  void _popAllAndOpenHome({
    required PopAllAndOpenHomeEvent event,
    required Emitter<IBaseRouterState> emit,
  }) {}

  void _openLinkAfterHome({
    required OpenLinkAfterHomeEvent event,
    required Emitter<IBaseRouterState> emit,
  }) {}

  void push({
    required String link,
  }) {
    add(PushEvent(
      link: link,
    ));
  }

  void pop() {
    add(
      PopEvent(),
    );
  }

  bool isValidPop() {
    return state.pages.length > 1;
  }
}

class IBaseRouterState {
  final List<BasePage<dynamic>> pages;

  IBaseRouterState({
    required this.pages,
  });

  IBaseRouterState copyWith(List<BasePage<dynamic>>? pages) {
    return IBaseRouterState(
      pages: pages ?? this.pages,
    );
  }

  IBaseRouterState.initial()
      : pages = [
          const BasePage(
            child: SplashPageView(),
          ),
        ];
}

class BasePage<T> extends MaterialPage<T> {
  const BasePage({
    required super.child,
  });
}
