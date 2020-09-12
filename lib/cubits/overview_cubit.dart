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

import 'package:cubit_study/cubits/overview_states.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewCubit extends Cubit<OverviewState> {
  final BogusRepository repository;

  OverviewCubit(
    this.repository,
  ) : super(OverviewState(temperature: 19, cameraIds: [])) {
    refresh();
  }

  Future<void> refresh() async {
    emit(
      LoadingOverviewState(
        temperature: state.temperature,
        cameraIds: state.cameraIds,
      ),
    );

    final temperature = repository.currentTemperature();
    final userCameras = await repository.getUserCamerasIds();

    emit(
      OverviewState(
        temperature: temperature,
        cameraIds: userCameras,
      ),
    );
  }
}
