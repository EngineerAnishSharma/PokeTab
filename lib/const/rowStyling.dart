
import 'package:flutter/material.dart';
import 'package:poke_app/const/text_style.dart';

import 'colors.dart';

Widget rowStyling({String? text, String? value}) {
  return Row(
    children: [
      SizedBox(width: 150, child: headingText(color: grey, size: 16, text: text)),
      headingText(color: grey, size: 16, text: value),
    ],
  );
}
