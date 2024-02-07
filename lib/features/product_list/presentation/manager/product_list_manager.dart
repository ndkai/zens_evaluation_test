import 'dart:async';

import '../../data/models/option.dart';

class DropdownController {
  final _controller = StreamController<Option>();
  Stream<Option> get stream => _controller.stream;

  void updateState(Option newState) {
    _controller.add(newState);
  }
  void dispose() {
    _controller.close();
  }
}