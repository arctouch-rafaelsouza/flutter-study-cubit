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

class OverviewState extends Equatable {
  final int temperature;
  final List<int> cameraIds;

  OverviewState({
    @required this.temperature,
    @required this.cameraIds,
  })  : assert(temperature != null),
        assert(cameraIds != null);

  @override
  List<Object> get props => [temperature, cameraIds];
}

class LoadingOverviewState extends OverviewState {
  LoadingOverviewState({
    int temperature,
    List<int> cameraIds,
  }) : super(
          temperature: temperature,
          cameraIds: cameraIds,
        );
}
