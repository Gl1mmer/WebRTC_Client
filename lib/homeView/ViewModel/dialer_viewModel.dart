import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialerViewModel extends StateNotifier<String> {
  DialerViewModel() : super('');

  void appendDigit(String d) => state = state + d;

  void backspace() {
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }

  void clear() => state = '';

  void call() {
    print('Calling $state');
  }
}

final dialerProvider = StateNotifierProvider<DialerViewModel, String>(
      (ref) => DialerViewModel(),
);
