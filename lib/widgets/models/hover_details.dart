import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hover_details.freezed.dart';

@freezed
abstract class HoverDetails with _$HoverDetails {
  const factory HoverDetails({
    required bool isHover,
    required Color color,
  }) = _HoverDetails;

  const HoverDetails._();
}
