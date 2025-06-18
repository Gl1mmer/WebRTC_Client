import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'web_RTC_client_app.dart';

void main() {
  runApp (
    const ProviderScope(
      child: webRtcClientApp(),
    ),
  );
}




