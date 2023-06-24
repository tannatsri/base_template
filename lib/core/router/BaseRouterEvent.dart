abstract class IBaseRouterEvent {}

class PushEvent extends IBaseRouterEvent {
  final String link;

  PushEvent({
    required this.link,
  });
}

class PopEvent extends IBaseRouterEvent {
  PopEvent();
}

class OpenLinkAfterHomeEvent extends IBaseRouterEvent {
  final String link;

  OpenLinkAfterHomeEvent({
    required this.link,
  });
}

class PopAllAndOpenHomeEvent extends IBaseRouterEvent {
  PopAllAndOpenHomeEvent();
}
