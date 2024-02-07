import 'dart:async';

class MyStreamController<T> {
  final _controller = StreamController<T>();
  Stream<T> get stream => _controller.stream;

  void updateState(T newState) {
    _controller.add(newState);
  }
  void dispose() {
    _controller.close();
  }
}
