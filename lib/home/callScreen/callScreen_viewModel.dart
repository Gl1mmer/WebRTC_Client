import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallViewModel extends StateNotifier<bool> {
  CallViewModel() : super(false);

  void startCall(String number) {
    state = true;
    print('CallViewModel: startCall → $number');
  }

  void toggleMute() {
    print('CallViewModel: toggleMute');
  }

  void toggleSpeaker() {
    print('CallViewModel: toggleSpeaker');
  }

  void hangUp() {
    state = false;
    print('CallViewModel: hangUp');
  }
}

final callProvider = StateNotifierProvider<CallViewModel, bool>(
      (ref) => CallViewModel(),
);
