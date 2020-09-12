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

import 'package:cubit_study/cubits/camera_states.dart';
import 'package:cubit_study/models/camera.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraCubit extends Cubit<CameraState> {
  final BogusRepository repository;

  CameraCubit(
    this.repository,
    int cameraId,
  ) : super(CameraState(camera: Camera(id: cameraId))) {
    refresh();
  }

  Future refresh() async {
    emit(state.copyWith(busy: true));

    final camera = await repository.getCameraData(state.camera.id);

    emit(CameraState(camera: camera, busy: false));
  }

  Future toggle() async {
    emit(state.copyWith(busy: true));

    final camera = await repository.toggleCamera(state.camera.id);

    emit(CameraState(camera: camera, busy: false));
  }
}
