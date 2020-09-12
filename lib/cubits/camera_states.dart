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

import 'package:cubit_study/models/camera.dart';
import 'package:equatable/equatable.dart';

class CameraState extends Equatable {
  final Camera camera;
  final bool busy;

  CameraState({
    this.camera,
    this.busy = false,
  });

  @override
  List<Object> get props => [camera, busy];

  CameraState copyWith({
    Camera camera,
    bool busy,
  }) =>
      CameraState(
        camera: camera ?? this.camera,
        busy: busy ?? this.busy,
      );
}
