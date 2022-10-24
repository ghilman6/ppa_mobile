// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const DARK_PRIMARY_COLOR = Color(0xFF303F9F);
//const LIGHT_PRIMARY_COLOR = const Color(0xFFC5CAE9);
//const PRIMARY_COLOR = const Color(0xFF3F51B5);
const PRIMARY_COLOR = Color(0xFF02499B);
const LIGHT_PRIMARY_COLOR = Color(0xFFE5F7FE);
const TEXT_ICONS_COLOR = Color(0xFFFFFFFF);
const LIGHT_ACCENT_COLOR = Color(0xFFFFF3CC);
const ACCENT_COLOR = Color(0xFFF6A51C);
const PRIMARY_TEXT_COLOR = Color(0xFF2F2E41);
const SECONDARY_TEXT_COLOR = Color(0x6602499B);
const DIVIDER_COLOR = Color(0xFFBDBDBD);
const LIGHT_DIVIDER_COLOR = Color(0xFFCFD8DC);
const DISABLED_COLOR = Color(0xFF212121);
const SUCCESS_COLOR = Color(0xFF04C104);
const DANGER_COLOR = Color(0xFFED170D);
const WARNING_COLOR = Color(0xFFF6A51C);
const LIGHT_DISABLED_COLOR = Color(0xFFBDBDBD);
final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
);

final kInnerDecorationDark = BoxDecoration(
  color: Colors.grey[900],
  borderRadius: BorderRadius.circular(10),
);
final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: [Color(0xe6053265), Color(0xe64c99f1)],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
  ),
  borderRadius: BorderRadius.circular(10),
);
final kGradientBoxDecorationRevese = BoxDecoration(
  gradient: const LinearGradient(
    colors: [Color(0xe6053265), Color(0xe64c99f1)],
    stops: [0.0, 1.0],
    begin: FractionalOffset.bottomRight,
    end: FractionalOffset.topLeft,
  ),
  borderRadius: BorderRadius.circular(10),
);
