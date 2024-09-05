import 'dart:async';

class EventBus {
  // Implementing Singleton Pattern to ensure Only one Instance Exists
  static final EventBus _instance = EventBus._internal();

  factory EventBus() => _instance;

  EventBus._internal();

  final _streamController = StreamController.broadcast();

  void publish(dynamic event) {
    _streamController.add(event);
  }

  Stream<T> on<T>() {
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  void dispose() {
    _streamController.close();
  }
}
