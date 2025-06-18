import 'package:flutter/material.dart';

import 'package:nomad_codes_project/authentificationView/View/auth_checker_view.dart';

class webRtcClientApp extends StatelessWidget {
  const webRtcClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebRTC Client MVP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthCheckerView(),
    );
  }
}