import 'dart:io';

import 'package:flutter/material.dart';

class HdrPlayer extends StatelessWidget {
  const HdrPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const UiKitView(
        viewType: 'hdr_player',
      );
    }
    throw UnimplementedError();
  }
}