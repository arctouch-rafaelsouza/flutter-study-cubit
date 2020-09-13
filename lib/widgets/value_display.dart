/*
 * Copyright 2020 ArcTouch LLC.
 * All rights reserved.
 *
 * This file, its contents, concepts, methods, behavior, and operation
 * (collectively the "Software") are protected by trade secret, patent,
 * and copyright laws. The use of the Software is governed by a license
 * agreement. Disclosure of the Software to third parties, in any form,
 * in whole or in part, is expressly prohibited except as authorized by
 * the license agreement.
 */

import 'package:flutter/material.dart';

class ValueDisplay extends ImplicitlyAnimatedWidget {
  final int value;
  final String suffix;
  final Color color;
  final TextStyle style;

  const ValueDisplay({
    Key key,
    @required this.value,
    this.suffix,
    this.color,
    this.style,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 600),
    VoidCallback onEnd,
  })  : assert(value != null),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  @override
  _ValueDisplayState createState() => _ValueDisplayState();
}

class _ValueDisplayState extends AnimatedWidgetBaseState<ValueDisplay> {
  IntTween _value;
  ColorTween _color;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_value?.evaluate(animation)}${widget.suffix}',
      style: (widget.style ?? Theme.of(context)?.textTheme?.bodyText2).copyWith(
        color: _color?.evaluate(animation),
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _value = visitor(_value, widget.value, (value) => IntTween(begin: value));
    _color = visitor(_color, widget.color, (value) => ColorTween(begin: value));
  }
}
