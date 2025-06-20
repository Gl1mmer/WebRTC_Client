import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagesViewModel extends StateNotifier<int> {
  PagesViewModel() : super(2);

  void changeTab(int index) {
    state = index;
  }
}

final mainTabProvider = StateNotifierProvider<PagesViewModel, int>(
      (ref) => PagesViewModel(),
);
