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

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class LocationVisibilityState extends Equatable {
  final bool showInterior;
  final bool showExterior;

  LocationVisibilityState({
    @required this.showInterior,
    @required this.showExterior,
  })  : assert(showInterior != null),
        assert(showExterior != null);

  @override
  List<Object> get props => [showInterior, showExterior];

  LocationVisibilityState copyWith({
    bool showInterior,
    bool showExterior,
  }) =>
      LocationVisibilityState(
        showInterior: showInterior ?? this.showInterior,
        showExterior: showExterior ?? this.showExterior,
      );
}
